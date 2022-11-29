cmake_minimum_required(VERSION "3.12")

project("uygarkov-cmakeChallenge" VERSION 1.0)

find_package(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(yaml-cpp REQUIRED)

find_package(Boost REQUIRED COMPONENTS filesystem container)

add_executable(main main.cpp fem/fem.cpp filesystem/filesystem.cpp flatset/flatset.cpp yamlParser/yamlParser.cpp)

target_link_libraries(main Boost::filesystem Boost::container yaml-cpp)

DEAL_II_SETUP_TARGET(main)