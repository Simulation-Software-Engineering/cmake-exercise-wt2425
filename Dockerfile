FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone

RUN chmod +x /usr/local/bin/inittimezone

RUN inittimezone

RUN apt-get update -y

RUN apt install g++ build-essential -y  cmake -y  git -y wget -y vim -y

RUN apt install libboost-all-dev -y

RUN apt install libdeal.ii-dev -y

RUN git clone https://github.com/jbeder/yaml-cpp.git

WORKDIR yaml-cpp/build

RUN cmake ..

RUN make

run make install

WORKDIR /main

COPY . .

RUN mkdir -p /main/build

CMD ["/bin/bash"]

