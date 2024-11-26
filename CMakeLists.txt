# Set the minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

# Set the project name
project(exercise)

# Set the C++ standard (adjust if needed)
set(CMAKE_CXX_STANDARD 14)


# Part 1
# Boost libraries
find_package(Boost 1.71 REQUIRED COMPONENTS filesystem)

# Include Boost headers
include_directories(${Boost_INCLUDE_DIRS})

# flatset
set(FLATSET_SOURCES flatset/flatset.cpp)

# Include directories for the flatset module
include_directories(flatset)

# Part 2
# deal II
find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR} 
             PATHS /usr/lib/cmake/deal.II)

# Add the source file for the Fem class
set(FEM_SOURCES fem/fem.cpp)

# Include directories for the fem module
include_directories(fem)


# Part 3
# Filesystem
set(FILESYSTEM_SOURCES filesystem/filesystem.cpp)

# Include directories for the filesystem module
include_directories(filesystem)

# Add the source files to the executable
add_executable(main main.cpp ${FEM_SOURCES} ${FLATSET_SOURCES} ${FILESYSTEM_SOURCES})

# Link Boost Filesystem
target_link_libraries(main Boost::filesystem)


# Link deal.II to the executable
deal_ii_setup_target(main)

# If you need specific libraries or include directories, add them here:
# target_include_directories(main PRIVATE /path/to/headers)
# target_link_libraries(main PRIVATE /path/to/library)

# Optionally set debugging options
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    message(STATUS "Building in Debug mode")
endif()
