FROM ubuntu:22.04

WORKDIR /ws

COPY main.cpp .
COPY CMakeLists.txt .
COPY inittimezone /usr/local/bin/inittimezone

# ###
COPY fem/ ./fem/
COPY filesystem/ ./filesystem/
COPY flatset/ ./flatset/
COPY yamlParser/ ./yamlParser/

# ###
RUN chmod +x /usr/local/bin/inittimezone
CMD ./usr/local/bin/inittimezone

# ###
RUN apt update && apt install -y build-essential cmake git wget vim

RUN apt install -y libdeal.ii-dev libboost-all-dev

# RUN git clone https://github.com/jbeder/yaml-cpp ./yaml-cpp && \
#     mkdir ./yaml-cpp/build && cd ./yaml-cpp/build && \
#     cmake .. && make && make install
	
# ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"