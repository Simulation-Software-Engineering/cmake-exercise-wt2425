FROM ubuntu:22.04
COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone
RUN apt update -y && apt install -y vim git build-essential cmake wget libdeal.ii-dev libboost-all-dev mpich && rm -rf /var/lib/apt/lists/*
RUN mkdir /project
WORKDIR /project
RUN git clone https://github.com/jbeder/yaml-cpp.git
RUN mkdir -p yaml-cpp/build && cd yaml-cpp/build && cmake .. && make && make install
COPY . ./
RUN mkdir build; cd build; cmake ..; make
