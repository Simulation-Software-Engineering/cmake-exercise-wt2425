cmake_minimum_required(VERSION "3.12")

find_package(deal.II 9.5.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
deal_ii_initialize_cached_variables()

project("Cmake-exercise")

find_package(Boost 1.56 REQUIRED COMPONENTS
             container filesystem )

find_package(yaml-cpp REQUIRED)

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/*.cpp filesystem/*.cpp flatset/*.cpp yamlParser/*.cpp)
add_executable(main "${SRC_FILES}")

deal_ii_setup_target(main)

target_link_libraries(main Boost::container
                          Boost::filesystem yaml-cpp)

