cmake_minimum_required(VERSION "3.12")

project("fightCmake")

# ###
find_package(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES()


find_package(
  Boost 1.74 REQUIRED COMPONENTS
  container filesystem
)

find_package(yaml-cpp REQUIRED CONFIG)

# ###
add_executable(
  main
  main.cpp
  fem/fem.cpp
  filesystem/filesystem.cpp
  flatset/flatset.cpp
  yamlParser/yamlParser.cpp
)

DEAL_II_SETUP_TARGET(main)

target_link_libraries(main Boost::container Boost::filesystem yaml-cpp)
