cmake_minimum_required(VERSION "3.12")

project("SUMANTH0703_CMAKE_EXERCISE")

find_package(Boost 1.56 REQUIRED COMPONENTS
             date_time filesystem container iostreams)

FIND_PACKAGE(deal.II 9.4.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable("HardFought" "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp")

DEAL_II_SETUP_TARGET(hardfought)

TARGET_LINK_LIBRARIES(hardfought Boost::date_time Boost::filesystem Boost::container Boost::iostreams)
