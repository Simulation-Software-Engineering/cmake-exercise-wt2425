FROM ubuntu:22.04

WORKDIR /cmake_exercise
COPY /cmake cmake_exercise

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update -y
RUN apt-get install -y build-essential cmake git wget vim
RUN apt-get install -y libboost-container-dev libboost-filesystem-dev
RUN apt-get install -y ibdeal.ii-dev

WORKDIR cmake_exercise/build
RUN cmake ..
RUN make
RUN ./cmakeexercise

CMD ["/bin/bash"]
