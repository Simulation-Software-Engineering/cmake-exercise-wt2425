FROM ubuntu:24.04

RUN apt-get update 
RUN apt-get install build-essential cmake zip wget vim libboost-all-dev libdeal.ii-dev -y

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz && tar -xzf yaml-cpp-0.6.3.tar.gz
RUN mkdir /yaml-cpp-yaml-cpp-0.6.3/build
WORKDIR /yaml-cpp-yaml-cpp-0.6.3/build
RUN cmake .. && make && make install
WORKDIR /
RUN rm -rf /yaml-cpp-yaml-cpp-0.6.3 /yaml-cpp-0.6.3.tar.gz

RUN mkdir /cmake_exercise
WORKDIR /cmake_exercise

COPY . /cmake_exercise

CMD ["/bin/bash"]
