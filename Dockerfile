FROM ubuntu:22.04
RUN /bin/bash
COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN /usr/local/bin/inittimezone

RUN apt update -y && apt install -y build-essential
RUN apt install -y cmake
RUN apt install -y git
RUN apt install -y wget
RUN apt install -y vim
RUN apt install -y libboost-all-dev
RUN apt install -y libdeal.ii-dev
 
RUN git clone https://github.com/jbeder/yaml-cpp.git
WORKDIR /home/yaml-cpp/build
RUN cmake ..
RUN make
RUN make install

RUN cd /home 
RUN git clone https://github.com/senatirpan/cmake-exercise-wt2223.git

WORKDIR /home/cmake-exercise-wt2223/build
RUN cmake ..
RUN make
