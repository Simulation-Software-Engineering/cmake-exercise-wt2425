cmake_minimum_required(VERSION 3.12)

project(main)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(Boost REQUIRED COMPONENTS container filesystem)
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)

# Include directories and source files
include_directories(flatset filesystem fem yamlParser)

add_executable(main 
    main.cpp 
    filesystem/filesystem.cpp 
    flatset/flatset.cpp 
    fem/fem.cpp 
    yamlParser/yamlParser.cpp
)

# Link libraries and setup deal.II
target_link_libraries(main 
    Boost::filesystem 
    yaml-cpp
)
deal_ii_setup_target(main)