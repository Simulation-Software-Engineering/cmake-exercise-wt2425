cmake_minimum_required(VERSION "3.12")

project("berkgugc-cmake")

find_package(Boost REQUIRED COMPONENTS container filesystem)
find_package(deal.II REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
DEAL_II_INITIALIZE_CACHED_VARIABLES()
find_package(yaml-cpp REQUIRED CONFIG)

add_executable(berkgugcEXEC "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp" "yamlParser/yamlParser.cpp")
target_link_libraries(berkgugcEXEC Boost::container Boost::filesystem yaml-cpp)
DEAL_II_SETUP_TARGET(berkgugcEXEC)