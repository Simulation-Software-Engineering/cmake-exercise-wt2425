FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone && ./usr/local/bin/inittimezone
ENV ENV_TEST_VARIABLE = mananijh
RUN apt-get update -y && apt-get install build-essential cmake git wget vim -y
RUN apt install libboost-all-dev libdeal.ii-dev -y
RUN mkdir /cmakeExercise/
COPY . /cmakeExercise/

RUN cd /cmakeExercise/ && git clone https://github.com/jbeder/yaml-cpp.git

RUN mkdir -p /cmakeExercise/yaml-cpp/build/ 

RUN cd /cmakeExercise/yaml-cpp/build/ && cmake .. && make install 

RUN mkdir -p /cmakeExercise/build/ && cd /cmakeExercise/build/ && cmake .. && make

CMD ["bin/bash"]