cmake_minimum_required(VERSION 3.12)

# Set the project name
project("cmake-exercise")


# Add required packages
# Boost
find_package(Boost 1.83 REQUIRED COMPONENTS container filesystem)

# deal.II
find_package(deal.II 9.3.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
deal_ii_initialize_cached_variables()

# yaml-cpp
find_package(yaml-cpp REQUIRED)


# Add the sources
set(SOURCES
    main.cpp
    fem/fem.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
    yamlParser/yamlParser.cpp
)

# Add the executable
add_executable(main ${SOURCES})

# Link the libraries
target_link_libraries(main boost_container boost_filesystem yaml-cpp)

deal_ii_setup_target(main)