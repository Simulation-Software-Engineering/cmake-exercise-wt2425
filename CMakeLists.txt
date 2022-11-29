cmake_minimum_required(VERSION "3.12")

project("CMake Exercise")

file(GLOB SRC_FILES
    main.cpp
    filesystem/*.cpp
    flatset/*.cpp
    fem/*.cpp
    yamlParser/*.cpp
)

add_executable(main "${SRC_FILES}")

# deal.II
find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()
deal_ii_setup_target(main)

# boost
find_package(Boost COMPONENTS filesystem container REQUIRED)
target_link_libraries(main Boost::filesystem Boost::container)

# yaml-cpp
find_package(yaml-cpp REQUIRED CONFIG)
target_link_libraries(main yaml-cpp)
