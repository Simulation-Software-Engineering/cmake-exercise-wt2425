cmake_minimum_required(VERSION "3.12")

# Set the project name
project(cmake-exercise)

# Add required packages
find_package(Boost 1.83 REQUIRED COMPONENTS container filesystem)

find_package(deal.II 9.3.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
deal_ii_initialize_cached_variables()

find_package(yaml-cpp 0.6.3 REQUIRED)

# Add the executable
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/*.cpp filesystem/*.cpp flatset/*.cpp yamlParser/*.cpp)
add_executable(main "${SRC_FILES}")

# Link the executable to the required libraries
target_link_libraries(main Boost::container Boost::filesystem yaml-cpp)
deal_ii_setup_target(main)