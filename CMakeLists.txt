cmake_minimum_required(VERSION "3.10")

project("cmake_exercise")

find_package(deal.II 9.5.0 REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
deal_ii_initialize_cached_variables()

find_package(Boost REQUIRED COMPONENTS container filesystem)

find_package(yaml-cpp REQUIRED)


set(SourceFiles
    main.cpp
    fem/fem.cpp
    filesystem/filesystem.cpp
    flatset/flatset.cpp
    yamlParser/yamlParser.cpp
)

add_executable(main ${SourceFiles})

deal_ii_setup_target(main)

target_link_libraries(main boost_container boost_filesystem yaml-cpp)