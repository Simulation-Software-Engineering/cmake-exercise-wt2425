cmake_minimum_required(VERSION "3.12")
# NAME OF THE EXECUTABLE FILE.
project("main")

# FIND THE NECESSARY PACKAGES
find_package(
  Boost 1.74 REQUIRED COMPONENTS
  container filesystem
)
find_package(deal.II 9.3.2 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES()


add_executable(
main
main.cpp
flatset/flatset.cpp
filesystem/filesystem.cpp
fem/fem.cpp)

DEAL_II_SETUP_TARGET(main)

target_link_libraries(main Boost::container Boost::filesystem)
