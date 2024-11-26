cmake_minimum_required(VERSION "3.10")

project("cmake_exercise")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# deal.ii
find_package(deal.II 9.3.0 REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
deal_ii_initialize_cached_variables()

# boost
find_package(Boost 1.83 REQUIRED COMPONENTS container filesystem)

# yaml-cpp
find_package(yaml-cpp REQUIRED)


# sources
set(SOURCES
    main.cpp
    fem/fem.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
    yamlParser/yamlParser.cpp
)

# executable Entry
add_executable(main ${SOURCES})

# Link the libraries
target_link_libraries(main 
                      boost_container 
                      boost_filesystem 
                      yaml-cpp)

deal_ii_setup_target(main)