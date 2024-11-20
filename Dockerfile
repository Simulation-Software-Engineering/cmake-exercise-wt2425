FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential cmake unzip wget vim libboost-all-dev libdeal.ii-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/cmake-exercise
WORKDIR /app/cmake-exercise
COPY fem/ /app/cmake-exercise/fem/
COPY filesystem/ /app/cmake-exercise/filesystem/
COPY flatset/ /app/cmake-exercise/flatset/
COPY yamlParser/ /app/cmake-exercise/yamlParser/
COPY build_and_run.sh CMakeLists.txt main.cpp /app/cmake-exercise/