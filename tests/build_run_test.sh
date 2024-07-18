#!/bin/bash

# Remove the BUILD directory if it exists
if [ -d "BUILD" ]; then
    rm -rf BUILD
fi

# Create the BUILD directory
mkdir -p BUILD
cd BUILD

# Build and run tests
if command -v ninja > /dev/null 2>&1; then
	cmake -GNinja ..
	ninja all
else
    echo "Ninja is not installed."
	cmake ..
	make
fi

ctest --output-on-failure 2>&1 | tee unit_test_log.txt

cmake --build . --target coverage
