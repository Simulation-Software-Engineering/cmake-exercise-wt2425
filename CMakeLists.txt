cmake_minimum_required(VERSION "3.12")

project("cmake-ex-aroravi")

find_package(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})

DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(Boost 1.74 REQUIRED COMPONENTS
             container filesystem)

find_package(yaml-cpp REQUIRED CONFIG)

add_executable(cmake-run
    "main.cpp"
    "fem/fem.cpp"
    "filesystem/filesystem.cpp"
    "flatset/flatset.cpp"
    "yamlParser/yamlParser.cpp")

DEAL_II_SETUP_TARGET(cmake-run)
target_link_libraries(cmake-run Boost::container Boost::filesystem yaml-cpp)

