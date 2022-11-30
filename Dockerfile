FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone

RUN apt update && apt install -y \
    build-essential cmake git wget vim \
    libboost-all-dev libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp  ~/yaml-cpp && \
    && mkdir -p ~/yaml-cpp/build && cd ~/yaml-cpp/build  \
    cmake .. && make && make install\
    rm -rf ~/yaml-cpp

COPY . ~/cmake-exercise/
RUN cd ~/cmake-exercise && mkdir build && \
    cmake .. && make && make install

ENTRYPOINT [ "/bin/sh" ]
