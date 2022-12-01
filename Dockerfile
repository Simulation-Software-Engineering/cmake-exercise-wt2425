FROM ubuntu:22.04

COPY . /cmake_e/
RUN apt update -y
RUN apt install build-essential cmake git wget vim -y
RUN apt install libboost-all-dev -y
RUN apt install libdeal.ii-dev -y
RUN apt-get install libyaml-cpp-dev
