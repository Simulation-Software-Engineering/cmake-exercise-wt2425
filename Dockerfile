# Start with the Ubuntu 24.04 base image
FROM ubuntu:24.04

# Set a consistent environment variable for the project workspace
ENV PROJECT_DIR=/app
WORKDIR $PROJECT_DIR

# Update package manager and install essential tools
RUN apt update && \
    apt install -y \
        build-essential \
        cmake \
        git \
        wget \
        vim \
        unzip \
        g++ && \
    rm -rf /var/lib/apt/lists/*

# Install Boost libraries
RUN apt update && \
    apt install -y libboost-all-dev && \
    rm -rf /var/lib/apt/lists/*

# Install deal.II library
RUN apt update && \
    apt install -y libdeal.ii-dev && \
    rm -rf /var/lib/apt/lists/*

# Install yaml-cpp (v0.6.3) from source
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip
RUN unzip -o yaml-cpp-0.6.3.zip
RUN cd yaml-cpp-yaml-cpp-0.6.3 && cmake . && make install

# Set the library path for installed libraries
ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

