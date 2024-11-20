FROM ubuntu:24.04

# Install base dependencies for cmake
RUN apt update && apt install -y g++ cmake unzip wget vim build-essential

# Install libraries required by program
RUN apt install -y libboost-all-dev libdeal.ii-dev

RUN apt clean

# Install custom version of yaml-cpp
WORKDIR /root
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.tar.gz
RUN tar -xzf yaml-cpp-0.6.3.tar.gz
RUN mkdir -p /root/yaml-cpp-yaml-cpp-0.6.3/build
WORKDIR /root/yaml-cpp-yaml-cpp-0.6.3/build
RUN cmake .. && make
RUN make install
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
RUN yaml-cpp-config --version || echo "yaml-cpp not installed correctly"
WORKDIR /root
RUN rm -rf /yaml-cpp-yaml-cpp-0.6.3/ /yaml-cpp-0.6.3.tar.gz

CMD ["/bin/bash"]