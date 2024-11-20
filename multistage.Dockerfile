FROM ubuntu:24.04 AS build

# Install Build-dependencies. We do not need to clear the apt cache, since this build-image 
# is separate from the image shipping to the user.
# We install fixed versions for boost here, so the build env matches the runtime env later.
# For deal.ii that is not available. For this exercise I will accept that.
# For a real deployment the real solution might be to install from source as well.
RUN apt-get update ; \
    apt-get install -y build-essential cmake make unzip wget ; \
    apt-get install -y libboost1.83-all-dev libdeal.ii-dev

# Add libyaml from source in the required version
ADD https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip /tmp/yaml-cpp.zip
RUN cd /tmp ; \
    unzip /tmp/yaml-cpp.zip ; \
    cd /tmp/yaml-cpp-yaml-cpp-0.6.3 ; \
    mkdir build ; cd build ; \
    cmake -DYAML_BUILD_SHARED_LIBS=ON .. ; \
    make -j$(nproc) install

RUN mkdir -p /work
COPY . /work

RUN cd /work ; \
    mkdir -p build-docker ; \
    cd build-docker ; \
    cmake -DCMAKE_BUILD_TYPE=Release .. ; \
    make -j$(nproc) ; \
    tar -czf main.tar.gz $(find . -type f \( -iname main -o -iname \*.so \))

FROM ubuntu:24.04 as run

# Install the runtime dependencies only (so no -dev packages).
# These are only available with fixed versions, so we use them (which also benefits stability)
# We also need libsundials-nvecserial6 explicitly for some reason. If not installed here, it is missing.
RUN apt-get update ; \
    apt-get install -y build-essential cmake unzip ; \
    apt-get install -y libdeal.ii-9.5.1 libboost-container1.83.0 libboost-filesystem1.83.0 libsundials-nvecserial6 ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add libyaml from source in the required version.
ADD https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip /tmp/yaml-cpp.zip
RUN cd /tmp ; \
    unzip /tmp/yaml-cpp.zip ; \
    cd /tmp/yaml-cpp-yaml-cpp-0.6.3 ; \
    mkdir build ; cd build ; \
    cmake -DYAML_BUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release .. ; \
    make -j$(nproc) install ; \
    cd / ; \
    rm -rf /tmp/*

# Remove build dependencies for yaml-cpp again.
RUN apt-get remove -y build-essential cmake unzip ; apt-get -y autoremove

RUN mkdir -p /opt/exercise
COPY --from=build /work/build-docker/main.tar.gz /opt/exercise/main.tar.gz
RUN cd /opt/exercise ; tar -xzf main.tar.gz ; rm main.tar.gz

CMD /opt/exercise/main
