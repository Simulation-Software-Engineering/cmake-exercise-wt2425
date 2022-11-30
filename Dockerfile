FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

RUN apt update
RUN apt install -y build-essential
RUN apt install -y cmake
RUN apt install -y git
RUN apt install -y wget
RUN apt install -y vim

RUN apt install -y libboost-all-dev
RUN apt install -y libdeal.ii-dev

WORKDIR /home
RUN git clone https://github.com/jbeder/yaml-cpp.git
RUN mkdir /home/yaml-cpp/build
WORKDIR /home/yaml-cpp/build
RUN cmake ..
RUN make
RUN make install

WORKDIR /home
RUN git clone https://github.com/musteng/cmake-exercise-wt2223.git
RUN mkdir /home/cmake-exercise-wt2223/build

WORKDIR /home/cmake-exercise-wt2223/build
RUN cmake ..
RUN make
