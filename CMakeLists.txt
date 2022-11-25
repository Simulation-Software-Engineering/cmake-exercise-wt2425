cmake_minimum_required(VERSION "3.12")

project("Anja fighting with CMake, Docker, and some dependencies")

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp flatset.cpp filesystem.cpp)

find_package(Boost 1.74 REQUIRED COMPONENTS container filesystem)
include_directories(${BOOST_INCLUDE_DIRS})

add_executable(fight "${SRC_FILES}")

target_link_libraries(fight Boost::container Boost::filesystem)