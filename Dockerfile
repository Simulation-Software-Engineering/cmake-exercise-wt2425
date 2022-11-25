FROM ubuntu:22.04

RUN /bin/bash

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt install -y build-essential && apt install -y cmake && apt install -y git && apt install -y wget && apt install -y vim && apt-get install -y libboost-all-dev