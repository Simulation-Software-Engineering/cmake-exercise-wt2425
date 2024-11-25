cmake_minimum_required(VERSION 3.10)

# Project name and version
project(cmake_exercise-wt2425 VERSION 1.0)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include Boost dependencies
find_package(Boost REQUIRED COMPONENTS filesystem)

# Include Boost headers
include_directories(${Boost_INCLUDE_DIRS})

# Include deal.II
find_package(deal.II REQUIRED HINTS ${CMAKE_PREFIX_PATH})

# Add YAML-cpp library (installed manually)
find_library(YAML_CPP_LIB yaml-cpp REQUIRED)

# Add source files and directories
include_directories(flatset filesystem fem yamlParser)

# Add the executable
add_executable(main main.cpp
    flatset/flatset.cpp
    filesystem/filesystem.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp)

# Link libraries
target_link_libraries(main ${Boost_LIBRARIES} ${YAML_CPP_LIB} ${DEAL_II_LIBRARIES})
