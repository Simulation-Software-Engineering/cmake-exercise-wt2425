FROM ubuntu:24.04

WORKDIR /appdata

RUN apt update && apt install -y \
 build-essential \
 cmake \
 unzip \
 wget \
 libboost-all-dev \
 libdeal.ii-dev

COPY . .

CMD ["/appdata/build_and_run.sh"]