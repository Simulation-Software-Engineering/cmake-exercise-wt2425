# Note: this file is designed to be readable for me
# and someone trying to check whether I did do and understood the exercises.
# Therefore, it on purpose contains comments and stuff that obviously in
# a production Dockerfile I would not include.
# 
# Commands to perform to test this dockerfile:
# docker build -t cmakefelix .
# docker run -it cmakefelix
# cd build && cmake .. && make

FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

COPY . /data/
WORKDIR "/data"
RUN /bin/bash


RUN apt-get update && apt-get install -y build-essential vim
# RUN g++ main.cpp -o main
# RUN ./main


RUN PATH="/Applications/CMake.app/Contents/bin":"$PATH"
RUN apt-get update && apt-get -y install cmake protobuf-compiler
# RUN mkdir -p buildv
# WORKDIR "/data/build"
# RUN cmake ..


RUN apt-get update && apt-get -y install cmake libboost-all-dev libdeal.ii-dev
# RUN cmake ..

WORKDIR "/data"
RUN apt-get update && apt-get -y install git
RUN git clone https://github.com/jbeder/yaml-cpp.git
RUN mkdir -p yaml-cpp/build && cd yaml-cpp/build && cmake .. && make && make install
RUN LD_LIBRARY_PATH="/usr/local/lib":"$LD_LIBRARY_PATH"
# WORKDIR "/data/build"
# RUN cmake ..