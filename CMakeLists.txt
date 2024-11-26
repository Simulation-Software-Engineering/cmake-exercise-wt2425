cmake_minimum_required(VERSION 3.10)

project(FightCMakeDocker)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


# Find Boost libraries 
find_package(Boost REQUIRED COMPONENTS filesystem)

include_directories(${CMAKE_SOURCE_DIR}/flatset)

add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp)

# Link the Boost Filesystem library
target_link_libraries(main PRIVATE Boost::filesystem)