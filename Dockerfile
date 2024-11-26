FROM ubuntu:24.04

RUN apt update && apt install -y build-essential cmake vim unzip wget libboost-all-dev libdeal.ii-dev

WORKDIR /exercise
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip yaml-cpp-0.6.3.zip && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd /exercise && \
    rm -rf yaml-cpp-0.6.3.zip yaml-cpp-yaml-cpp-0.6.3

RUN mkdir /exercise/cmake-exercise
COPY . /exercise/cmake-exercise

WORKDIR /exercise/cmake-exercise

CMD ["/bin/bash"]
