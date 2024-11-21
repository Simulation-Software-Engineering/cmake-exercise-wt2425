FROM ubuntu:24.04

# Install necessary packages
RUN apt update && \
    apt install --no-install-recommends -y build-essential cmake unzip wget vim

RUN apt install --no-install-recommends -y libboost-all-dev libdeal.ii-dev && \
    apt autoremove && \
    apt autoclean

# Install yaml-cpp
WORKDIR /tmp
RUN wget --no-check-certificate https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip ./yaml-cpp-0.6.3.zip && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && make install && \
    rm -rf /tmp/yaml-cpp-0.6.3.zip /tmp/yaml-cpp-yaml-cpp-0.6.3

# Copy the source code
RUN mkdir -p /app/cmake-exercise
WORKDIR /app/cmake-exercise

COPY fem ./fem
COPY filesystem ./filesystem
COPY flatset ./flatset
COPY yamlParser ./yamlParser

COPY build_and_run.sh CMakeLists.txt main.cpp ./

CMD ["/bin/bash"]