cmake_minimum_required(VERSION "3.24")

project("Exercise")

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(deal.II 9.5.0 REQUIRED)
deal_ii_initialize_cached_variables()

find_package(yaml-cpp REQUIRED)

add_library(flatset flatset/flatset.cpp)
target_link_libraries(flatset PRIVATE Boost::container)

add_library(filesystem filesystem/filesystem.cpp)
target_link_libraries(filesystem PRIVATE Boost::filesystem)

add_library(fem fem/fem.cpp)
deal_ii_setup_target(fem)

add_library(yamlParser yamlParser/yamlParser.cpp)
target_link_libraries(yamlParser PRIVATE ${YAML_CPP_LIBRARIES})

add_executable(main main.cpp)
target_link_libraries(main PRIVATE flatset filesystem fem yamlParser)

