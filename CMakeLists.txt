cmake_minimum_required(VERSION 3.12)
project(main)

set(LIBRARY_OUTPUT_PATH  ${CMAKE_BINARY_DIR}/lib)

add_library(fs SHARED filesystem/filesystem.cpp)
add_library(fltst SHARED flatset/flatset.cpp)
add_library(ymlprsr SHARED yamlParser/yamlParser.cpp)

find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
deal_ii_initialize_cached_variables()
add_library(fm SHARED fem/fem.cpp)
deal_ii_setup_target(fm)

add_executable(main main.cpp)
target_link_libraries(main fs)
target_link_libraries(main fltst)
target_link_libraries(main fm)
target_link_libraries(main ymlprsr)

find_package(Boost REQUIRED filesystem)
include_directories(${Boost_INCLUDE_DIRS})
target_link_libraries(main ${Boost_LIBRARIES})

find_package(yaml-cpp)
include_directories(${YAML_CPP_INCLUDE_DIRS})
target_link_libraries(main ${YAML_CPP_LIBRARIES})

include_directories(${DEAL_II_INCLUDE_DIRS})
target_link_libraries(main ${DEAL_II_LIBRARIES})


