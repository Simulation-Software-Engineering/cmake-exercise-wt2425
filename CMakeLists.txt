cmake_minimum_required(VERSION 3.12)

project("cmake_exercise")

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()

find_package(yaml-cpp REQUIRED)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/*.cpp filesystem/*.cpp flatset/*.cpp yamlParser/*.cpp)
add_executable(main "${SRC_FILES}")

target_link_libraries(main Boost::container Boost::filesystem yaml-cpp)

deal_ii_setup_target(main)