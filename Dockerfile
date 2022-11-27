# Specify the base image
FROM ubuntu:22.04

# Define the working directory
WORKDIR /usr/local/src/cmake-exercise-herbjs

# Copy files to the container
COPY . /usr/local/src/cmake-exercise-herbjs

# Init time zone
COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

# Update package sources
RUN apt update

# Install basic utilities for building from source
RUN apt install -y build-essential cmake git wget vim

# Install boost libraries
RUN apt install -y libboost-filesystem-dev libboost-container-dev

# Install Deal.II
RUN apt install -y libdeal.ii-dev

# Clone yaml-cpp from GitHub
RUN git clone https://github.com/jbeder/yaml-cpp /usr/local/src/yaml-cpp

# Build yaml-cpp from source
RUN mkdir /usr/local/src/yaml-cpp/build && cd /usr/local/src/yaml-cpp/build && cmake .. && make && make install

# Build cmake-exercise
RUN mkdir /usr/local/src/cmake-exercise-herbjs/build && cd /usr/local/src/cmake-exercise-herbjs/build && cmake .. && make

# Run the binary and start a bash session after that
#CMD ["/usr/local/src/cmake-exercise-herbjs/build/cmake_exercise /usr/local/src/cmake-exercise-herbjs/yamlParser/config.yml && /bin/bash"]
CMD ["/bin/bash"]