FROM ubuntu:24.04

RUN apt-get update && apt-get install build-essential cmake zip wget vim libboost-all-dev libdeal.ii-dev -y

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz && tar -xzf yaml-cpp-0.6.3.tar.gz
RUN mkdir /yaml-cpp-yaml-cpp-0.6.3/build
WORKDIR /yaml-cpp-yaml-cpp-0.6.3/build
RUN cmake .. && make && make install
WORKDIR /
RUN rm -rf /yaml-cpp-yaml-cpp-0.6.3 /yaml-cpp-0.6.3.tar.gz

RUN mkdir /cmake-exercise
WORKDIR /cmake-exercise

COPY . /cmake-exercise

CMD ["/bin/bash"]