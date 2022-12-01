FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x inittimezone.

RUN apt-get update -y && apt-get install -y build-essentinal cmake git wget vim libboost-all-dev libdeal.ii-dev

WORKDIR /yaml
RUN git clone https://github.com/jbeder/yaml-cpp.git
RUN cd yaml-cpp/ && mkdir build && cd build/ && cmake .. && make && sudo make install
RUN cd .. && cd ..

WORKDIR /cmake-ex
COPY Documents/cmake-ex/cmake-exercise-wt2223/ cmake-ex

WORKDIR cmake-ex/build
RUN cmake .. && make && ./main

CMD ["/bin/bash"]
