FROM ubuntu:22.04
CMD ["/bin/bash"]

WORKDIR /usr/local/src/cmake_exercise_bhawsina
COPY . /usr/local/src/cmake_exercise_bhawsina

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update
RUN apt-get install git cmake wget build-essential vim -y

RUN apt install -y libboost-all-dev libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp.git /usr/local/src/yaml-cpp
RUN mkdir -p /usr/local/src/yaml-cpp/build
RUN cd /usr/local/src/yaml-cpp/build && cmake .. && make install

RUN mkdir /usr/local/src/cmake_exercise_bhawsina/build && cd /usr/local/src/cmake_exercise_bhawsina/build && cmake .. && make