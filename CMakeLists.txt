cmake_minimum_required(VERSION 3.12)
set(CMAKE_CXX_STANDARD 20)

project("CMake_Exercise")

find_package(Boost COMPONENTS container filesystem)
find_package(deal.II 9.3.2)
find_package(yaml-cpp)

set(sourceFiles
        main.cpp
        fem/fem.cpp
        flatset/flatset.cpp
        filesystem/filesystem.cpp
        yamlParser/yamlParser.cpp)

add_executable(main ${sourceFiles})

DEAL_II_SETUP_TARGET(main DEBUG)
target_link_libraries(main Boost::boost Boost::filesystem yaml-cpp)
