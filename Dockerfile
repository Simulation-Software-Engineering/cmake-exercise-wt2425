FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update && \
    apt-get install -y \
        build-essential cmake git wget \
        libboost-all-dev libdeal.ii-dev && \
    rm -rf /var/lib/apt/lists/* && \
    true

RUN git clone https://github.com/jbeder/yaml-cpp /usr/local/src/yaml-cpp && \
    mkdir /usr/local/src/yaml-cpp/build && \
    cd /usr/local/src/yaml-cpp/build && \
    cmake .. && \
    make && \
    make install && \
    true

RUN mkdir --parents /usr/local/src/cmake-exercise/build

COPY . /usr/local/src/cmake-exercise/

RUN cd /usr/local/src/cmake-exercise/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Debug && \
    make && \
    make install && \
    true

WORKDIR /usr/local/src/cmake-exercise

CMD cmake-exercise /usr/local/src/cmake-exercise/yamlParser/config.yml
