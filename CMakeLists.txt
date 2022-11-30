cmake_minimum_required(VERSION 3.13)  # CMake version check
project("wagnerln_cmake_exercise")               # Create project "simple_example"
set(CMAKE_CXX_STANDARD 14)            # Enable c++14 standard

find_package(Boost 1.71 REQUIRED COMPONENTS
             container filesystem)


# Add executable target with source files listed in SOURCE_FILES variable
add_executable(wagnerln_cmake_exercise_executable "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp"))
target_link_libraries(wagnerln_cmake_exercise_executable Boost::container Boost::filesystem)