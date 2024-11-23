cmake_minimum_required(VERSION 3.10) # Adjust according to your required version
project(MyProject)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
# file(GLOB_RECURSE SOURCES "main.cpp" "filesystem/filesystem.cpp filesystem/filesystem.hpp")

# Add the executable
# set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
# set(SOURCES "main.cpp" "filesystem/*.cpp */filesystem.hpp")
# set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)
set(LIBRARY_OUTPUT_PATH  ${CMAKE_BINARY_DIR}/lib)

add_library(fs SHARED filesystem/filesystem.cpp)

add_executable(MyProject main.cpp)
target_link_libraries(MyProject fs)

# Find Boost libraries (e.g., Boost Filesystem)
find_package(Boost REQUIRED filesystem)

if(Boost_FOUND)
    message("Boost Found")
    include_directories(${Boost_INCLUDE_DIRS})
    target_link_libraries(MyProject ${Boost_LIBRARIES})
elseif(NOT Boost_FOUND)
    error("Boost Not Found")
endif()