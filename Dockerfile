FROM ubuntu:24.04


RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    g++ \
    libboost-all-dev \
    vim


WORKDIR /cmake-exercise

# copy project files 
COPY . .


CMD ["/bin/bash"]
