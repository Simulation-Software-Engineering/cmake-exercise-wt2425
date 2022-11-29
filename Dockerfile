FROM ubuntu:22.04

WORKDIR /exercise
COPY . .
RUN ./inittimezone
RUN apt-get update && apt-get install -y \
  g++ \
  make \
  cmake \
  libdeal.ii-dev \
  libboost-all-dev \
  git \
  wget     
RUN git clone https://github.com/jbeder/yaml-cpp.git
WORKDIR /exercise/yaml-cpp/build
RUN cmake .. && make install
WORKDIR /exercise
CMD ["/bin/bash"]

