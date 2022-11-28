FROM ubuntu:22.04

RUN /bin/bash

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt install -y build-essential cmake git wget vim libboost-all-dev libdeal.ii-dev

RUN cd /usr/local/src 
RUN git clone https://github.com/bergdola/cmake-exercise-wt2223.git 
RUN cd cmake-exercise-wt2223 
RUN git clone https://github.com/jbeder/yaml-cpp.git 
RUN cd yaml-cpp 
RUN mkdir build && cmake .. && make install && cd /usr/local/src/cmake-exercise-wt2223
RUN mkdir build && cd build && cmake .. && make ./cmake-ex-bergdola && ./cmake-ex-bergdola


