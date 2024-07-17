cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME FractalImage)

project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 17)

set(prj-include-base
  ${PROJECT_SOURCE_DIR}/dummy
)

add_executable(${PROJECT_NAME}
  src/main.cpp
  src/dummy/dummy.cpp
)

# Get the latest Git commit hash
execute_process(
    COMMAND git rev-parse HEAD
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Pass the Git commit hash to the compiler
add_definitions(-DGIT_COMMIT_HASH="${GIT_COMMIT_HASH}")