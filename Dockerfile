FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
CMD ./usr/local/bin/inittimezone

COPY . /usr/local/src/cmake-ex/
RUN apt update && apt install -y build-essential cmake git wget vim
RUN apt install -y libdeal.ii-dev libboost-all-dev

RUN git clone https://github.com/jbeder/yaml-cpp ./yaml-cpp && \
    mkdir ./yaml-cpp/build && cd ./yaml-cpp/build && \
    cmake .. && make && make install

RUN cd /usr/local/src/cmake-ex && \
    rm -rf build && mkdir build 

RUN cd /usr/local/src/cmake-ex/build && \
    cmake -S ../ -B . && make

WORKDIR /usr/local/src/cmake-ex/build