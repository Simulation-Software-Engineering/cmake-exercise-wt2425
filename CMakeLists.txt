cmake_minimum_required(VERSION 3.13.4)

project(CMakeExercise)

# Dynamic linking of of deal.II package
find_package(deal.II 9.5.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
deal_ii_initialize_cached_variables()

# Static linking of local libraries
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp flatset/*.cpp filesystem/*.cpp fem/*.cpp yamlParser/*.cpp)
add_executable(main "${SRC_FILES}")

# Deal.II setup logic
deal_ii_setup_target(main DEBUG)

# Dynamic linking of boost library
find_package(Boost 1 REQUIRED COMPONENTS filesystem)
target_link_libraries(main Boost::boost Boost::filesystem)

# Dynamic linking of yaml-cpp library
find_package(yaml-cpp 0.6.3 REQUIRED)
target_link_libraries(main yaml-cpp)
