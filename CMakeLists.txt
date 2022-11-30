cmake_minimum_required(VERSION "3.12")
# NAME OF THE EXECUTABLE FILE.
project("main")

# FIND THE NECESSARY PACKAGES
find_package(
  Boost 1.74 REQUIRED COMPONENTS
  container filesystem
)

add_executable(
main
main.cpp
flatset/flatset.cpp
filesystem/filesystem.cpp)
target_link_libraries(main Boost::container Boost::filesystem)
