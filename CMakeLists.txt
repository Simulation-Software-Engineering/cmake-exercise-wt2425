cmake_minimum_required(VERSION "3.12")
 
project("CMakePractice")

find_package(Boost 1.71 REQUIRED COMPONENTS
             container filesystem)

find_package(deal.II 9.1.1 REQUIRED
    HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES() #deal.II magic

find_package(yaml-cpp REQUIRED)

add_executable(CMakePractice main.cpp fem/fem.cpp flatset/flatset.cpp filesystem/filesystem.cpp yamlParser/yamlParser.cpp)

target_link_libraries(CMakePractice Boost::container Boost::filesystem  yaml-cpp)
DEAL_II_SETUP_TARGET(CMakePractice)

install(TARGETS CMakePractice)