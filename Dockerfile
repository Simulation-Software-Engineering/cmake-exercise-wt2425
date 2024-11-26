FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim
    
WORKDIR /cmake-exercise
COPY . /cmake-exercise