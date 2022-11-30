FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update && apt install -y \
    build-essential cmake git wget vim \
    libboost-all-dev libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp  ~/yaml-cpp \
    && mkdir -p ~/yaml-cpp/build && cd ~/yaml-cpp/build  \
    && cmake .. && make && make install

COPY . cmake-exercise/
RUN rm -rf cmake-exercise/build && mkdir -p cmake-exercise/build/
RUN cd cmake-exercise/build && cmake .. && make && make install

ENTRYPOINT [ "bash" ]

