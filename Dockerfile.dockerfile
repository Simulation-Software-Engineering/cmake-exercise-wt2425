FROM ubuntu:24.04

RUN apt update 
RUN apt install -y g++ 
RUN apt install -y wget 
RUN apt install -y build-essential
RUN apt install -y cmake 
RUN apt install -y git 
RUN apt install -y libdeal.ii-dev
RUN apt install -y libboost-all-dev 
RUN apt clean

CMD ["/bin/bash"]