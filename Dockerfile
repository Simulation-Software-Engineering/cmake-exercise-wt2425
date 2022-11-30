FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

CMD ["/bin/bash"]


RUN apt-get update && \
    apt-get install -y build-essential \
		       cmake \
		       git \
		       wget \
		       vim \
		       libboost-all-dev \
		       libdeal.ii-dev

RUN mkdir yaml-cpp

WORKDIR /yaml-cpp

RUN git clone https://github.com/jbeder/yaml-cpp . && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

RUN mkdir -p /cmakeExercise/build

WORKDIR /cmakeExercise

COPY . ./
