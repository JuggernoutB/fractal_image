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

