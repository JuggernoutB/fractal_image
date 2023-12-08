cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME UnitTests)

project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 17)

set(prj-include-base
  ${PROJECT_SOURCE_DIR}/dummy
)

# Locate GTest
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

add_executable(${PROJECT_NAME}
  unit/main_test.cpp
  ../src/dummy/dummy.cpp
)

target_link_libraries(${PROJECT_NAME} ${GTEST_LIBRARIES} pthread)

