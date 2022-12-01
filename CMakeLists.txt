cmake_minimum_required(VERSION "3.12")

PROJECT(Darth-Cmake)

FIND_PACKAGE(Boost REQUIRED COMPONENTS
             filesystem container)
FIND_PACKAGE(deal.II 9.3.2 REQUIRED HINTS ${DEAL_II_DIR} ../ ../ ../ $ENV{DEAL_II_DIR})
FIND_PACKAGE(yaml-cpp REQUIRED CONFIG)

DEAL_II_INITIALIZE_CACHED_VARIABLES()
FIND_PACKAGE(yaml-cpp)

ADD_EXECUTABLE(main "main.cpp" "fem/fem.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "yamlParser/yamlParser.cpp")

DEAL_II_SETUP_TARGET(main)

TARGET_LINK_LIBRARIES(main Boost::filesystem Boost::container yaml-cpp)
