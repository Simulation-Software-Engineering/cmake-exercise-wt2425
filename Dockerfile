FROM ubuntu:24.04

# Install Build-essential packages and then clear APT cache to ensure minimal image size
# (this increases build time, but that would practically outweigh the increased download time for each user)
RUN apt-get update ; \
    apt-get install -y build-essential cmake make unzip wget ; \
    apt-get install -y libboost-all-dev libdeal.ii-dev ;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add libyaml from source in the required version
ADD https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip /tmp/yaml-cpp.zip
RUN cd /tmp ; \
    unzip /tmp/yaml-cpp.zip ; \
    cd /tmp/yaml-cpp-yaml-cpp-0.6.3 ; \
    mkdir build ; cd build ; \
    cmake -DYAML_BUILD_SHARED_LIBS=ON .. ; \
    make -j$(nproc) install ; \
    cd / ; \
    rm -rf /tmp/*

# Add our source code directly to the image. Can also be mounted. Depends on use-case
COPY . /cmake-exercise
