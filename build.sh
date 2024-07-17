#!/bin/bash
PROJECT_NAME="Fractal_Image"

# Function to print the usage of the script
usage()
{
    echo "usage: $0 "
    echo "    -p, --project      project name"
}

# Parse command-line arguments
while [ "$1" != "" ]; do
    case $1 in
        -p | --project )
            shift
            PROJECT_NAME=$1
            ;;
        * )
            usage
            exit 1
    esac
    shift
done

# Remove the BUILD directory if it exists
if [ -d "BUILD" ]; then
    rm -rf BUILD
fi

# Create the BUILD directory
mkdir -p BUILD
cd BUILD

# Define the path to the executable
EXECUTABLE_PATH="./$PROJECT_NAME"

# Run CMake to configure the project
cmake .. -DPROJECT_NAME=$PROJECT_NAME

# Build the project
cmake --build .

# Run the project
# Check if the executable exists
if [[ -f "$EXECUTABLE_PATH" ]]; then
    "$EXECUTABLE_PATH"
else
    echo "Error: Executable $EXECUTABLE_PATH not found."
fi
