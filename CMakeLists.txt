cmake_minimum_required(VERSION "3.12")

project("C_Make_Exercise")

find_package(Boost 1.74 REQUIRED COMPONENTS filesystem)
find_package(deal.II 9.3 REQUIRED
        HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
DEAL_II_INITIALIZE_CACHED_VARIABLES()
find_package(yaml-cpp REQUIRED)

add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp yamlParser/yamlParser.cpp)

target_link_libraries(main "${Boost_FILESYSTEM_LIBRARY}" yaml-cpp)
DEAL_II_SETUP_TARGET(main)

install(TARGETS main)
