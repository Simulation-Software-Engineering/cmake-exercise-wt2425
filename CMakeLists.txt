cmake_minimum_required(VERSION "3.12")

project("SSE Exercise")


# for library fem
find_package(deal.II REQUIRED 
HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
deal_ii_initialize_cached_variables()
add_library(fem fem/fem.cpp)
deal_ii_setup_target(fem)

# for flatset
add_library(flatset flatset/flatset.cpp)

# for filesystem
find_package(Boost COMPONENTS filesystem REQUIRED)
include_directories(
    ${BOOST_INCLUDE_DIRS}
)
add_library(filesystem filesystem/filesystem.cpp)

# for yamlcpp
find_package(yaml-cpp REQUIRED)
add_library(yaml yamlParser/yamlParser.cpp)

add_executable(main main.cpp)
deal_ii_setup_target(main)

target_link_libraries(main flatset)
target_link_libraries(main filesystem Boost::filesystem)
target_link_libraries(main yaml yaml-cpp)

target_link_libraries(main fem)