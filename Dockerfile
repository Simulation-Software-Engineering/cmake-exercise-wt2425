FROM ubuntu:24.04

# Install all dependencies
RUN apt update && apt-get install g++ cmake build-essential unzip wget vim libboost-all-dev libdeal.ii-dev dos2unix -y
RUN apt clean

# Download yaml-cpp and unzip and store in /home/
RUN cd /tmp/ && \
    wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip yaml-cpp-0.6.3.zip -d ../home/ && \
    rm yaml-cpp-0.6.3.zip

# Create build folder inside yaml-cpp and install binaries
RUN cd /home/yaml-cpp-yaml-cpp-0.6.3/ && mkdir build && cd build && \ 
    cmake .. && make && make install

# Create new directory for cmake-exercise inside home
RUN cd /home/ && mkdir cmake-exercise

# Change current working directory to cmake-exercise
WORKDIR /home/cmake-exercise

# Copy all contents of the repository from local to cmake-exercise in the container
COPY . .

# Convert line endings to Unix format in case the local machine is Windows
RUN dos2unix ./build_and_run.sh

CMD [ "/bin/bash" ]