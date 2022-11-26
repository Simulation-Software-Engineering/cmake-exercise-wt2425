cmake_minimum_required(VERSION "3.12")

project("SUMANTH0703_CMAKE_EXERCISE")

find_package(Boost 1.74 REQUIRED COMPONENTS
             container filesystem)

FIND_PACKAGE(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

add_executable("HardFought" "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp")

DEAL_II_SETUP_TARGET(HardFought)

TARGET_LINK_LIBRARIES(HardFought Boost::filesystem Boost::container)
