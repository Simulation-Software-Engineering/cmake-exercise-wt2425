FROM ubuntu:22.04
COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone

WORKDIR /fight

COPY main.cpp .
COPY CMakeLists.txt .
COPY fem/ ./fem/
COPY filesystem/ ./filesystem/
COPY flatset/ ./flatset/

RUN apt update && apt install -y build-essential cmake git wget vim

RUN apt install -y libboost-all-dev libdeal.ii-dev


