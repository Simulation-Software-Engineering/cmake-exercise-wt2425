# Use the official Ubuntu 24.04 image as the base image
FROM ubuntu:24.04

# Update the package list and install essential packages
RUN apt-get update && apt-get install  -y\
    build-essential \
    g++ \
    cmake \
    unzip \
    wget \
    vim \ 
    libboost-all-dev \
    libboost-system-dev \
    libdeal.ii-dev \ 
    dos2unix

# Clean up the apt cache to reduce the image size
RUN apt clean

# Download the specified version of yaml-cpp library from GitHub
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip \
    && unzip -o yaml-cpp-0.6.3.zip \
    && cd yaml-cpp-yaml-cpp-0.6.3 \
    && cmake . && make && make install \
    && cd .. && rm -rf yaml-cpp-yaml-cpp-0.6.3/

# Set the working directory to /cmake-exercise in the container
WORKDIR /cmake-exercise

# Copy all files from the current directory on the host into the working directory in the container
COPY . .

# Convert line endings in the build_and_run.sh script from Windows format to Unix format
RUN dos2unix ./build_and_run.sh

# Set the default command to execute when the container starts (opens a bash shell)
CMD [ "/bin/bash" ]