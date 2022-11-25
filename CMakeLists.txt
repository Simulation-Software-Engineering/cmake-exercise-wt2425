cmake_minimum_required(VERSION "3.12")

project("Anja fighting with CMake, Docker, and some dependencies")

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp flatset.cpp)

find_package(Boost 1.40 COMPONENTS program_options REQUIRED)
include_directories(${BOOST_INCLUDE_DIRS})

add_executable(fight "${SRC_FILES}")

target_link_libraries(fight Boost::program_options)