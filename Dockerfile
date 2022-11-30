# Setting the base image to ubuntu 22.04 
FROM ubuntu:22.04

# Run initimezone script to prevent the timezone.
COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone


RUN apt update && apt install -y build-essential cmake git wget vim

RUN apt install -y libdeal.ii-dev libboost-all-dev

## Moving the necessary files to the my workspace in the container.
WORKDIR /cmakeExercise

COPY main.cpp .
COPY CMakeLists.txt .
COPY fem/ ./fem/
COPY filesystem/ ./filesystem/
COPY flatset/ ./flatset/

# Install the required dependencies
RUN apt update && apt install -y build-essential cmake git wget vim libdeal.ii-dev libboost-all-dev

RUN mkdir build \
	&& cd build \
	&& cmake .. \
	&& make
