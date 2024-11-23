cmake_minimum_required(VERSION 3.12)

project("cmake_exercise")

# Boost package
find_package(Boost REQUIRED COMPONENTS container filesystem)
add_library(filesystem filesystem/filesystem.cpp)

# deal.II package
find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()
add_library(fem fem/fem.cpp)
deal_ii_setup_target(fem)

# yaml-cpp package
find_package(yaml-cpp REQUIRED)
add_library(yaml yamlParser/yamlParser.cpp)

add_library(flatset flatset/flatset.cpp)

add_executable(main main.cpp)
deal_ii_setup_target(main)

# link to main
target_link_libraries(main fem)
target_link_libraries(main filesystem Boost::filesystem)
target_link_libraries(main flatset)
target_link_libraries(main yaml yaml-cpp)