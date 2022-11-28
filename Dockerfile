From ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone

# Run inittimezone and install a few dependencies
RUN apt-get -qq update && \
    inittimezone && \
    apt-get -qq -y install \
        build-essential \
        g++ \
        vim \
        cmake \
        wget \
        git \
        libboost-all-dev \
        libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp /usr/local/src/yaml-cpp && \
     mkdir /usr/local/src/yaml-cpp/build && \
     cd /usr/local/src/yaml-cpp/build && \
     cmake -DYAML_BUILD_SHARED_LIBS=on .. && \
     make && \
     make install 

ADD . root/exercise

WORKDIR root/exercise
CMD ["/bin/bash"]
