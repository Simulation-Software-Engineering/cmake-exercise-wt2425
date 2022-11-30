cmake_minimum_required(VERSION "3.12")

project("cmake_exercise_strackmz")

find_package(Boost REQUIRED COMPONENTS container filesystem)

FIND_PACKAGE(deal.II REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable(cmake_exercise "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp")

target_link_libraries(cmake_exercise Boost::container Boost::filesystem)

DEAL_II_SETUP_TARGET(cmake_exercise)

