cmake_minimum_required(VERSION "3.12")

project("cmake_exercise_weilinms")

find_package(Boost REQUIRED COMPONENTS container filesystem)
FIND_PACKAGE(deal.II REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_subdirectory(yaml-cpp)

add_executable(main "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp" "yamlParser/yamlParser.cpp")
target_link_libraries(main Boost::container Boost::filesystem yaml-cpp)
DEAL_II_SETUP_TARGET(main)