FROM ubuntu:22.04

RUN /bin/bash

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt install -y build-essential cmake git wget vim libboost-all-dev libdeal.ii-dev

WORKDIR /usr/local/src 
RUN git clone https://github.com/bergdola/cmake-exercise-wt2223.git 
WORKDIR cmake-exercise-wt2223 
RUN git clone https://github.com/jbeder/yaml-cpp.git 
WORKDIR /usr/local/src/cmake-exercise-wt2223/yaml-cpp
RUN mkdir build
WORKDIR /usr/local/src/cmake-exercise-wt2223/yaml-cpp/build
RUN cmake -DYAML_BUILD_SHARED_LIBS=on .. && make && make install
WORKDIR /usr/local/src/cmake-exercise-wt2223
RUN mkdir build 
WORKDIR /usr/local/src/cmake-exercise-wt2223/build
RUN cmake .. && make ./cmake-ex-bergdola && ./cmake-ex-bergdola
