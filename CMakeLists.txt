cmake_minimum_required(VERSION "3.12")

project("AwesomeProject")

FIND_PACKAGE(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(yaml-cpp REQUIRED)

add_executable(AwesomeProject main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)

target_link_libraries(AwesomeProject Boost::filesystem yaml-cpp)

DEAL_II_SETUP_TARGET(AwesomeProject)
