FROM ubuntu:22.04

COPY ./inittimezone /usr/local/bin/inittimezone

RUN chmod +x inittimezone && inittimezone

RUN apt update -y && apt install -y build-essential cmake git wget vim 

RUN apt install -y libboost-all-dev libdeal.ii-dev

RUN mkdir /cmakeChallenge/ && cd /cmakeChallenge/ && git clone https://github.com/jbeder/yaml-cpp.git

RUN mkdir -p /cmakeChallenge/yaml-cpp/build/ 

RUN cd /cmakeChallenge/yaml-cpp/build/ && cmake .. && make install 

RUN cd /cmakeChallenge/ && git clone https://github.com/uygarkov/cmake-exercise-wt2223.git

CMD ["bin/bash"]