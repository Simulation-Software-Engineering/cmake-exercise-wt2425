cmake_minimum_required(VERSION "3.12")

find_package(deal.II 9.5.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
deal_ii_initialize_cached_variables()


project("cmake-exercise")

file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS main.cpp fem/fem.cpp filesystem/filesystem.cpp flatset/flatset.cpp)
add_executable(main "${SRC_FILES}")

find_package(Boost REQUIRED COMPONENTS filesystem container)
INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )


TARGET_LINK_LIBRARIES( main ${Boost_LIBRARIES} )

deal_ii_setup_target(main)