#!/usr/bin/env bash

# Ensure we're starting fresh
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
./main ../yamlParser/config.yml
