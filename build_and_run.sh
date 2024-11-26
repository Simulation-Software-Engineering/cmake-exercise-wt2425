# Normalize line endings to LF
sed -i 's/\r$//' "$0"

#!/usr/bin/env bash

# Clean up the build directory if it exists
if [ -d "build" ]; then
    rm -rf build
fi

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
./main ../yamlParser/config.yml
