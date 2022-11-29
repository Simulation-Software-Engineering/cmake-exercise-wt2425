FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN inittimezone

RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	cmake \
	git \
	wget \
	vim \
	ca-certificates \
	libboost-all-dev \
	libdeal.ii-dev

RUN git clone https://github.com/jbeder/yaml-cpp /tmp/yaml-cpp \
	&& cd /tmp/yaml-cpp \
	&& mkdir build && cd build \
	&& cmake -DYAML_BUILD_SHARED_LIBS=ON .. \
	&& make -j install 

WORKDIR /exercise
COPY . .
RUN rm -rf build \
	&& mkdir build \
	&& cd build \
	&& cmake -DCMAKE_BUILD_TYPE=Release .. \
	&& make -j

CMD ["/exercise/build/main", "yamlParser/config.yml"]
