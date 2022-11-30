
cmake_minimum_required(VERSION 3.1...3.25)

project(
  "Simulation SWE CMake Example"
  VERSION 1.0
  LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(yaml-cpp REQUIRED CONFIG)

add_executable(main main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)
DEAL_II_SETUP_TARGET(main)

target_link_libraries(main Boost::container Boost::filesystem yaml-cpp)