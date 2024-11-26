cmake_minimum_required(VERSION 3.12)

# Project name
project("cmake_exercise")

# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)

# List all the source files
set(SRC_FILES
    main.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
    fem/fem.cpp
    yamlParser/yamlParser.cpp
)

# Create executable
add_executable(main ${SRC_FILES})

# Boost package
find_package(Boost REQUIRED COMPONENTS filesystem system)
target_link_libraries(main Boost::filesystem Boost::system)

# deal.II package
find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()
deal_ii_setup_target(main)

# yaml-cpp package
find_package(yaml-cpp REQUIRED)
target_link_libraries(main yaml-cpp)





