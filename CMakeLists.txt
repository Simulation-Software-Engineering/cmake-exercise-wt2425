cmake_minimum_required(VERSION 3.12)

project(cmake-exercise)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)

# Set the build type to Debug if not specified
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()

# Recursively find all source files
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp flatset/*.cpp filesystem/*.cpp fem/*.cpp yamlParser/*.cpp)

# Find yaml-cpp package
find_package(yaml-cpp REQUIRED)

# Find Boost libraries
find_package(Boost 1.83 REQUIRED COMPONENTS filesystem)

# Find deal.II package
find_package(deal.II 9.3.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
deal_ii_initialize_cached_variables()

# Add the executable
add_executable(main ${SRC_FILES})

# Setup deal.II target
deal_ii_setup_target(main)

# Link libraries
target_link_libraries(main yaml-cpp Boost::boost Boost::filesystem)