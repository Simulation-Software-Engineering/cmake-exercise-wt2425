FROM ubuntu:22.04

WORKDIR /root
COPY /cmake root

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update -y
RUN apt-get install -y build-essential cmake git wget vim
RUN apt-get install -y libboost-container-dev libboost-filesystem-dev
RUN apt-get install -y ibdeal.ii-dev


CMD ["/bin/bash"]
