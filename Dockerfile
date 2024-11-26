FROM ubuntu:24.04

# core tools and dependencies 
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    g++ \
    wget \
    vim

# boost 
RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    libdeal.ii-dev


# deal.II installation
RUN apt-get install -y software-properties-common && \
    export REPO=ppa:ginggs/deal.ii-9.6.0-backports && \
    add-apt-repository -y $REPO && \
    apt-get update && \
    apt-get install -y libdeal.ii-dev

# Set the working directory
WORKDIR /cmake-exercise


COPY . .


CMD ["bash", "./build_and_run.sh"]
