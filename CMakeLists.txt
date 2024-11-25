cmake_minimum_required(VERSION 3.10)

project(cmake_exercise-wt2425)

# Specify C++ standard
set(CMAKE_CXX_STANDARD 17)

# Include dependencies
find_package(Boost REQUIRED COMPONENTS filesystem)

include_directories(${Boost_INCLUDE_DIRS})

# Add source files
add_executable(main main.cpp)

# Link libraries
target_link_libraries(main ${Boost_LIBRARIES} yaml-cpp)
