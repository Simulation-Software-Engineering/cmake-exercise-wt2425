# Use the official Ubuntu 24.04 image
FROM ubuntu:24.04

# Set the working directory to /workspace
WORKDIR /workspace

# Copy the current directory contents into the container at /workspace
COPY . .

# Install dependencies
RUN apt update
RUN apt install -y cmake
RUN apt install -y build-essential
RUN apt install -y make
RUN apt install -y libboost-all-dev
RUN apt install -y libdeal.ii-dev
RUN apt install -y unzip
RUN apt install -y wget
RUN apt install -y bash

# Download and install yaml-cpp
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip && \
    unzip -o yaml-cpp-0.6.3.zip && \
    cd yaml-cpp-yaml-cpp-0.6.3 && \
    cmake . && \
    make install && \
    cd .. && \
    rm -rf yaml-cpp-yaml-cpp-0.6.3.zip yaml-cpp-yaml-cpp-0.6.3

# Default command to run when the container starts
CMD ["/bin/bash", "./build_and_run.sh"]