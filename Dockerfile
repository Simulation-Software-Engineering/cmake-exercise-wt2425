FROM ubuntu:24.04

# apt-get installs basics
RUN apt-get update 
RUN apt-get install build-essential cmake unzip wget vim -y
# boost
RUN apt-get install libboost-all-dev -y
# deal II
RUN apt-get install libdeal.ii-dev -y


# no more used, now use mount
WORKDIR /cmake-exercise
# COPY build_and_run.sh .
# COPY main.cpp .
# COPY CMakeLists.txt .

# change the encoding of shell to remove '\r'
# RUN sed -i 's/\r$//' build_and_run.sh 
CMD ["/bin/bash"]