FROM ubuntu:22.04

RUN /bin/bash

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt install -y build-essential cmake git wget vim libboost-all-dev
RUN cd /usr/local/src && git clone https://github.com/bergdola/cmake-exercise-wt2223.git && cd cmake-exercise-wt2223 && mkdir build && cd build && cmake .. && make ./fight && ./fight