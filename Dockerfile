FROM ubuntu:22.04

RUN /bin/bash

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt install -y build-essential cmake git wget vim libboost-all-dev libdeal.ii-dev
RUN cd /usr/local/src && git clone https://github.com/bergdola/cmake-exercise-wt2223.git && cd cmake-exercise-wt2223 && rm -rf build && mkdir build && cd build && cmake .. && make ./cmake-ex && ./cmake-ex