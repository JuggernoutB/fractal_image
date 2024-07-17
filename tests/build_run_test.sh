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
if command -v ninja > /dev/null 2>&1; then
	cmake -GNinja ..
else
    echo "Ninja is not installed."
	cmake ..
fi

# Build tests
mingw32-make

#Run tests
ctest -v
