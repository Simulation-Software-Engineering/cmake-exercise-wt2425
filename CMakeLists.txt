cmake_minimum_required(VERSION 3.12)

# Define the project name.
project(herbjs_cmake_exercise)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp flatset/*.cpp filesystem/*.cpp fem/*.cpp yamlParser/*.cpp)

find_package(Boost REQUIRED COMPONENTS filesystem MODULE)

find_package(yaml-cpp REQUIRED CONFIG)

find_package(deal.II REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable(cmake_exercise "${SRC_FILES}")
target_link_libraries(cmake_exercise Boost::filesystem yaml-cpp)
DEAL_II_SETUP_TARGET(cmake_exercise)

install(TARGETS cmake_exercise)