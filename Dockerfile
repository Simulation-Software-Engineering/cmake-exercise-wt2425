# Use the official Ubuntu 24.04 image as a parent image
FROM ubuntu:24.04

# Set the working directory in the container
WORKDIR /usr/src/app

# Install basic packages
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    cmake \
    unzip \
    wget \
    vim \
    git \
    libboost-all-dev \
    libdeal.ii-dev

# Install yaml-cpp v0.6.3
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip yaml-cpp-0.6.3.zip \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install

# Set LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=/usr/local/lib

# Copy the file contents into the container at /usr/src/app
COPY build_and_run.sh CMakeLists.txt main.cpp /usr/src/app/cmake-exercise/

COPY flatset/ /usr/src/app/cmake-exercise/flatset/
COPY fem/ /usr/src/app/cmake-exercise/fem/
COPY filesystem/ /usr/src/app/cmake-exercise/filesystem/
COPY yamlParser/ /usr/src/app/cmake-exercise/yamlParser/

# Command to run when the container starts
CMD ["/bin/bash"]