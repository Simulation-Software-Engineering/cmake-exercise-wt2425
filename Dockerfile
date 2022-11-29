FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt install -y build-essential cmake git wget vim libboost-all-dev libdeal.ii-dev
 
RUN cd /usr/local/src && git clone https://github.com/jbeder/yaml-cpp.git && cd yaml-cpp && mkdir -p build && cd build && cmake .. -DYAML_BUILD_SHARED_LIBS=on && make && make install 
RUN git clone https://github.com/bergdola/cmake-exercise-wt2223.git /usr/local/src && cd /usr/local/src/cmake-exercise-wt2223 && mkdir build && cd build && cmake .. && make ./cmake-ex-bergdola && ./cmake-ex-bergdola
CMD cmake-exercise-wt2223 cmake-exercise-wt2223/yamlParser/config.yml
