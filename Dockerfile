From ubuntu:22.04

# Copy timezone script
COPY inittimezone /usr/local/bin/inittimezone

# Run inittimezone and install dependencies
RUN inittimezone && \
    apt-get -qq update && \
    apt-get -qq -y install \
        build-essential \
        cmake \
        g++ \
        git \
        libdeal.ii-dev \
        libboost-all-dev

# Add files to container
RUN mkdir -p /CMakeExercise/build
WORKDIR /CMakeExercise
RUN mkdir fem filesystem flatset

ADD fem/* fem/
ADD filesystem/* filesystem/
ADD flatset/* flatset/
ADD yamlParser/* yamlParser/
ADD main.cpp .
ADD CMakeLists.txt .

# Download and build yaml-cpp
RUN git clone https://github.com/jbeder/yaml-cpp.git && \
    cd yaml-cpp && cmake . && make install

RUN cd build && cmake .. && make

CMD ["/CMakeExercise/build/main"]
