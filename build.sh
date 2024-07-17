#!/bin/bash
export CC="c:/mingw64/bin/gcc"
export CXX="c:/mingw64/bin/g++"

SOURCE_DIR=$(pwd)
echo $SOURCE_DIR

# Remove the BUILD directory if it exists
if [ -d "BUILD" ]; then
    rm -rf BUILD
fi

# Create the BUILD directory
mkdir -p BUILD
cd BUILD

# Run CMake to configure the project
cmake -G "MinGW Makefiles" ..

# Build the project
cmake --build .
