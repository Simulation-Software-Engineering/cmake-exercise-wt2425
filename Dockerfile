FROM ubuntu:22.04

COPY . .

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update
RUN apt-get install g++ -y
RUN apt-get install cmake -y 
RUN apt-get install build-essential -y
RUN apt-get install wget -y
RUN apt-get install vim -y
RUN apt-get install libboost-all-dev -y
RUN apt-get install libdeal.ii-dev -y

RUN mkdir build

WORKDIR /build

CMD ["/bin/bash"]
