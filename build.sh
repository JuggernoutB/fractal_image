#!/bin/bash

# Remove the BUILD directory if it exists
if [ -d "BUILD" ]; then
    rm -rf BUILD
fi

# Create the BUILD directory
mkdir -p BUILD
cd BUILD

# Run CMake to configure the project
cmake ..

# Build the project
cmake --build .
