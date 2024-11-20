cmake_minimum_required(VERSION 3.12)

# Set the project name
project("cmake-exercise")

# Add the executable
add_executable(main main.cpp)

# Add libraries
add_library(flatset flatset/flatset.cpp)
add_library(fs filesystem/filesystem.cpp)
add_library(fem fem/fem.cpp)
# add_library(yamlParser yamlParser/yamlParser.hpp)

# Add packages
# Boost
find_package(Boost 1.83 REQUIRED)
# deal.II
find_package(deal.II 9.3.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
# OpenMPI
find_package(MPI REQUIRED)

target_link_libraries(main PRIVATE flatset fs boost_container boost_filesystem)