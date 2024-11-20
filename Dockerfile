FROM ubuntu:24.04

WORKDIR /app
RUN apt update && apt install -y build-essential cmake vim unzip wget libboost-all-dev libdeal.ii-dev

# install yaml-cpp from source
RUN cd /app && wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip yaml-cpp-0.6.3.zip && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build && cd build && cmake .. && make && make install


RUN mkdir cmake-exercise
COPY . ./cmake-exercise

CMD ["/bin/bash"]

