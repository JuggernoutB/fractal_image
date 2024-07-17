#!/bin/bash
cd tests

# Remove the BUILD directory if it exists
if [ -d "BUILD" ]; then
    rm -rf BUILD
fi

# Create the BUILD directory
mkdir -p BUILD
cd BUILD

# Run CMake to configure the project
cmake -G "MinGW Makefiles" ..

# Build tests
mingw32-make

#Run tests
ctest -v
