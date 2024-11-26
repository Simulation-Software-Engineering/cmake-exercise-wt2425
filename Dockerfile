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
RUN git clone --depth 1 --branch yaml-cpp-0.6.3 https://github.com/jbeder/yaml-cpp.git $PROJECT_DIR/yaml-cpp && \
    cd $PROJECT_DIR/yaml-cpp && \
    mkdir -p build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local && \
    make -j$(nproc) && \
    make install && \
    cd $PROJECT_DIR && \
    rm -rf yaml-cpp

# Set the library path for installed libraries
ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

