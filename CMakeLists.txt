cmake_minimum_required(VERSION 3.12)

project(main)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Boost package
find_package(Boost REQUIRED COMPONENTS container filesystem)

# deal.II package
find_package(deal.II REQUIRED)

# yaml-cpp package
find_package(yaml-cpp REQUIRED)

# Add libraries
add_library(filesystem filesystem/filesystem.cpp)
add_library(flatset flatset/flatset.cpp)
add_library(fem fem/fem.cpp)
add_library(yaml yamlParser/yamlParser.cpp)

# Add executable
add_executable(main main.cpp)

# Setup deal.II for the libraries and executable
deal_ii_setup_target(fem)
deal_ii_setup_target(main)

# Link libraries to the main executable
target_link_libraries(main filesystem Boost::filesystem)
target_link_libraries(main flatset)
target_link_libraries(main fem)
target_link_libraries(main yaml yaml-cpp)

# Include directories for each component
include_directories(flatset filesystem fem yamlParser)