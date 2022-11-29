FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
CMD ./usr/local/bin/inittimezone

RUN apt-get update -y && apt-get install -y build-essential cmake git wget vim libboost-all-dev libdeal.ii-dev

RUN mkdir exercise && cd exercise
RUN git clone https://github.com/jbeder/yaml-cpp ./yaml-cpp
RUN mkdir ./yaml-cpp/build && cd ./yaml-cpp/build && cmake .. && make && make install
RUN cd .. && git clone https://github.com/Congpy/cmake-exercise-wt2223.git
RUN mkdir ./build && cd ./build && cmake ../ && make

CMD ["/bin/bash"]
