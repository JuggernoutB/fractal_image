cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME UnitTests)

project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 17)

set(prj-include-base
  ${PROJECT_SOURCE_DIR}/dummy
)

# Download and unpack Google Test
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/release-1.12.1.zip
)
# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

add_executable(${PROJECT_NAME}
  unit/main_test.cpp
  ../src/dummy/dummy.cpp
)

# Link Google Test to the test executable
target_link_libraries(${PROJECT_NAME} gtest_main)

#target_link_libraries(${PROJECT_NAME} ${GTEST_LIBRARIES} pthread)

# Enable testing
enable_testing()

# Discover and add tests
include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})

