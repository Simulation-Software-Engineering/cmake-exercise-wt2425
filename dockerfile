FROM  ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone && inittimezone

RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y g++ && \
    apt-get install -y cmake && \
    apt-get install -y vim && \
    apt-get install -y libboost-all-dev && \
    apt-get install -y libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp.git && \
    cd yaml-cpp && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd ../../

COPY . cmake-exercise-wt2223

RUN cd cmake-exercise-wt2223 && \
    mkdir build && \
    cd build && \
    cmake ../ && \
    make && \
    make install
