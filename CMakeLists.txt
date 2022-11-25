cmake_minimum_required(VERSION "3.12")

project("cmake-ex")

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp flatset.cpp filesystem.cpp fem.cpp)

find_package(Boost 1.74 REQUIRED COMPONENTS container filesystem)
include_directories(${BOOST_INCLUDE_DIRS})

FIND_PACKAGE(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable(cmake-ex "${SRC_FILES}")

target_link_libraries(cmake-ex Boost::container Boost::filesystem)
DEAL_II_SETUP_TARGET(cmake-ex)