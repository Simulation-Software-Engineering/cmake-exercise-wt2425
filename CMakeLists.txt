cmake_minimum_required(VERSION "3.12")
project("cmake-exercise-neumantm")

FIND_PACKAGE(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(Boost 1.74 REQUIRED COMPONENTS
             container filesystem)

find_package(yaml-cpp REQUIRED CONFIG)

add_executable(cmake-exercise "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp" "yamlParser/yamlParser.cpp")

DEAL_II_SETUP_TARGET(cmake-exercise)

target_link_libraries(cmake-exercise Boost::container Boost::filesystem yaml-cpp)

install(TARGETS cmake-exercise)
