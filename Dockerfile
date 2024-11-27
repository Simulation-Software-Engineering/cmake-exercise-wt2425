# sudo docker build -t cmake-exercise .
# sudo docker run -it -v /home/syedm/workspace/sse/cmake/cmake-exercise-wt2425:/workspace cmake-exercise

FROM ubuntu:24.04

# Install basic tools and dependencies
# I've seperated the run commands rather than using && to cache commands that run find for the next build (to save time)
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y cmake
RUN apt-get install -y unzip
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libdeal.ii-dev
RUN apt-get install -y libopenmpi-dev
RUN apt-get install -y openmpi-bin
RUN apt-get install -y git

# Set a default working directory (can be overridden when mounting)
WORKDIR /workspace
COPY . .

# Build and install yaml-cpp v0.6.3
RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip
RUN unzip yaml-cpp-0.6.3.zip
RUN cmake ./yaml-cpp-yaml-cpp-0.6.3
RUN make install -j${nproc}
# I used nproc to make the install faster but it will use all available proc to make install


# Default entry point
CMD ["/bin/bash", "./build_and_run.sh"]
