cmake_minimum_required(VERSION "3.12")
project(pettersncmake)

find_package(Boost
    COMPONENTS container filesystem)

file (GLOB_RECURSE SRC_FILES1 CONFIGURE_DEPENDS filesystem/*.cpp)
add_library(filesystem "${SRC_FILES1}")
target_link_libraries(filesystem boost_filesystem)

file (GLOB_RECURSE SRC_FILES2 CONFIGURE_DEPENDS flatset/*.cpp)
add_library(flatset "${SRC_FILES2}")
target_link_libraries(flatset boost_container)

find_package(deal.II 9.5.0 REQUIRED CONFIG)

#file (GLOB_RECURSE SRC_FILES3 CONFIGURE_DEPENDS fem/*.cpp)
#add_library(fem "${SRC_FILES3}")
#deal_ii_setup_target(fem DEBUG)
#target_link_libraries(fem deal.II)

add_executable(main main.cpp)
#deal_ii_setup_target(main)

target_link_libraries(main flatset filesystem) # fem)
