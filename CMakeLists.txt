CMAKE_MINIMUM_REQUIRED(VERSION 3.12)

set(CMAKE_CXX_STANDARD 20)

project(Exercise-Cmake)

find_package(Boost COMPONENTS container filesystem)
find_package(yaml-cpp)
find_package(deal.II 9.3.2)

add_executable(main 
                main.cpp 
                flatset/flatset.cpp 
                filesystem/filesystem.cpp 
                yamlParser/yamlParser.cpp 
                fem/fem.cpp)

target_link_libraries(main Boost::boost Boost::filesystem yaml-cpp)

DEAL_II_SETUP_TARGET(main DEBUG)



