FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone

WORKDIR /cmake-exercise-wt2223
COPY . /cmake-exercise-wt2223

RUN inittimezone
RUN apt update
RUN apt install -y build-essential make git wget vim
RUN apt install -y libdeal.ii-dev
RUN apt install -y libboost-all-dev

RUN git clone https://github.com/jbeder/yaml-cpp.git
RUN mkdir -p cmake-exercise-wt2223/yaml-cpp/build
WORKDIR /cmake-exercise-wt2223/yaml-cpp/build
RUN cmake ..
RUN make install

WORKDIR /cmake-exercise-wt2223

CMD ["/bin/bash"]
