cmake_minimum_required(VERSION "3.12")
project("schiztn cmake-exercise")
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/*.cpp flatset/*.cpp filesystem/*.cpp)


find_package(Boost REQUIRED COMPONENTS filesystem container MODULE)
FIND_PACKAGE(deal.II REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable(cmakeexercise "${SRC_FILES}")

target_link_libraries(cmakeexercise Boost::filesystem)

DEAL_II_SETUP_TARGET(cmakeexercise)
