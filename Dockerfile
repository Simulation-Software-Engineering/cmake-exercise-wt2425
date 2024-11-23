FROM ubuntu:24.04

COPY . /root
RUN apt update
RUN apt install -y cmake
RUN apt install -y build-essential
RUN apt install -y make
RUN apt install -y libboost-all-dev
RUN apt install -y libdeal.ii-dev
RUN apt install -y unzip
RUN apt install -y wget 

WORKDIR /root
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip
RUN unzip -o yaml-cpp-0.6.3.zip
RUN cd yaml-cpp-yaml-cpp-0.6.3 && cmake . && make install

ENTRYPOINT [ "/bin/bash" ]