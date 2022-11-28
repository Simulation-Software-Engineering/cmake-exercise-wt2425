FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone

WORKDIR /exercise03
ENV LD_LIBRARY_PATH="/usr/local/lib"

RUN inittimezone
RUN apt update
RUN apt install -y build-essential make git wget vim
RUN apt install -y libboost-all-dev
RUN apt install -y libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp.git
RUN mkdir -p exercise03/yaml-cpp/build
WORKDIR /exercise03/yaml-cpp/build
RUN cmake ..
RUN make install

WORKDIR /exercise03
COPY . /exercise03

RUN mkdir -p exercise03/build
WORKDIR /exercise03/build

CMD ["/bin/bash"]