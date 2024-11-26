FROM ubuntu:24.04

WORKDIR /cmake-exercise

RUN apt update && apt install -y \
 build-essential \
 cmake \
 unzip \
 wget \
 libboost-all-dev \
 libdeal.ii-dev 

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz \
    && tar -xvzf yaml-cpp-0.6.3.tar.gz \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && cmake . \
    && make \
    && make install \
    && cd .. \
    && rm -rf yaml-cpp-yaml-cpp-0.6.3


 COPY . .

 CMD ["./build_and_run.sh"]



