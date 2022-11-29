FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone


# Run inittimezone and install a few dependencies
RUN apt-get -qq update && \
    inittimezone && \
    apt-get -qq -y install \
        build-essential \
        cmake \
        git

RUN apt-get -qq -y install \
        libboost-all-dev \
        libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp /src/yaml-cpp && \
    mkdir /src/yaml-cpp/build && \
    cd /src/yaml-cpp/build && \
    cmake .. && \
    make && \
    make install && \
    cd .. && \
    rm -rf build

COPY . /src/
RUN mkdir /src/build && cd /src/build && cmake .. && make -j4 
WORKDIR /src/
CMD ["./build/main", "yamlParser/config.yml"]