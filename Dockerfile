# Use the official Ubuntu image as the base image
FROM ubuntu:24.04

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    g++ \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    libboost-all-dev \
    libdeal.ii-dev

# Copy the source code into the container
COPY main.cpp .
COPY CMakeLists.txt .
COPY build_and_run.sh .
COPY filesystem ./filesystem
COPY flatset ./flatset
COPY fem ./fem



