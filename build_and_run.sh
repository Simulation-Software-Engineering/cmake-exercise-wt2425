#!/usr/bin/env bash

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
./main ../yamlParser/config.yml
