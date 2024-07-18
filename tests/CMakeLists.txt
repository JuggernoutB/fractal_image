cmake_minimum_required(VERSION 3.10)
project(Unit_Tests)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/dummy)

# Add source files
add_library(dummy ../src/dummy/dummy.cpp)

# Set policy for reproducible builds
if(POLICY CMP0135)
    cmake_policy(SET CMP0135 NEW)
endif()

# Include CTest to enable testing
include(CTest)

# Enable testing
enable_testing()

#Download and unpack Google Test
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Create a target for the tests
add_executable(runTests unit/main_test.cpp)
target_link_libraries(runTests PRIVATE gtest gtest_main dummy)

# Add a test to CTest
add_test(NAME runTests COMMAND runTests)

# Enable code coverage if using GCC (MinGW)
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    target_compile_options(runTests PRIVATE --coverage -O0 -fprofile-arcs -ftest-coverage)
    target_link_libraries(runTests PRIVATE --coverage)
endif()

# Ensure CTest uses verbose mode
set(CTEST_OUTPUT_ON_FAILURE TRUE)

# Add custom target for coverage
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_custom_target(coverage
        COMMAND ${CMAKE_MAKE_PROGRAM} runTests
        COMMAND gcovr -r ${CMAKE_SOURCE_DIR} --html --html-details -o coverage.html
        WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
        COMMENT "Generating code coverage report"
    )
endif()
