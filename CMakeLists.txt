cmake_minimum_required(VERSION 3.10)

# Check if the PROJECT_NAME is set, otherwise use a default value
if(NOT DEFINED PROJECT_NAME)
    set(PROJECT_NAME "DefaultProjectName")
endif()

# Print the custom parameter
message(STATUS "PROJECT_NAME is set to: ${PROJECT_NAME}")

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