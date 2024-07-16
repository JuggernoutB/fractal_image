@echo off
REM Remove the BUILD directory if it exists
if exist BUILD (
    rmdir /s /q BUILD
)

REM Create the BUILD directory
mkdir BUILD
cd BUILD

REM Run CMake to configure the project
cmake ..

REM Build the project
cmake --build .
