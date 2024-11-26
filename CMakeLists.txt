# Minimum required CMake version
cmake_minimum_required(VERSION 3.10)

# Define the project and the C++ standard
project(main LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Default to Debug mode if not explicitly set
if(NOT CMAKE_BUILD_TYPE)
  message(STATUS "Build type not specified. Setting to Debug mode.")
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the build type" FORCE)
endif()

# Collect all source files (automatically includes nested directories)
file(GLOB_RECURSE ALL_SOURCES
    ${CMAKE_SOURCE_DIR}/main.cpp
    ${CMAKE_SOURCE_DIR}/flatset/*.cpp
    ${CMAKE_SOURCE_DIR}/filesystem/*.cpp
    ${CMAKE_SOURCE_DIR}/fem/*.cpp
    ${CMAKE_SOURCE_DIR}/yamlParser/*.cpp
)

# Validate that source files are present
if(NOT ALL_SOURCES)
  message(FATAL_ERROR "No source files found. Please verify the directory structure.")
else()
  message(STATUS "Source files discovered: ${ALL_SOURCES}")
endif()

# Dependencies: yaml-cpp
find_package(yaml-cpp REQUIRED)
if(yaml-cpp_FOUND)
  message(STATUS "yaml-cpp library located.")
endif()

# Dependencies: Boost (specifically the filesystem module)
find_package(Boost 1.83 REQUIRED COMPONENTS filesystem)
if(Boost_FOUND)
  message(STATUS "Boost filesystem library located.")
endif()

# Dependencies: deal.II
find_package(deal.II 9.3.0 REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
if(deal.II_FOUND)
  message(STATUS "deal.II library configured successfully.")
  deal_ii_initialize_cached_variables()
else()
  message(FATAL_ERROR "deal.II library not found.")
endif()

# Define the main application executable
add_executable(main ${ALL_SOURCES})

# Apply deal.II-specific configurations to the target
deal_ii_setup_target(main)

# Link external libraries to the executable
target_link_libraries(main
    Boost::boost
    Boost::filesystem
    yaml-cpp
)
