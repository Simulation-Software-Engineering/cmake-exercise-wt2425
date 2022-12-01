cmake_minimum_required(VERSION "3.12")
project("cmake_e")

FIND_PACKAGE( Boost REQUIRED filesystem)
#INCLUDE_DIRECTORIES( ${Boost_INCLUDE_DIR} )

FIND_PACKAGE(deal.II 9.1.0 REQUIRED
  HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(PkgConfig)
pkg_check_modules(YAMLCPP REQUIRED yaml-cpp>=0.5)
include_directories(${YAMLCPP_INCLUDE_DIRS})

add_executable(main 
	main.cpp 
	fem/fem.cpp 
	filesystem/filesystem.cpp 
	flatset/flatset.cpp
	yamlParser/yamlParser.cpp
)
DEAL_II_SETUP_TARGET(main)
target_link_libraries(main Boost::filesystem  ${YAMLCPP_LIBRARIES})
