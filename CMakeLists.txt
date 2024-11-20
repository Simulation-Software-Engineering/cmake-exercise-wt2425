cmake_minimum_required(VERSION "3.12")

project(FightProject)

# Including main.cpp and its dependencies
file(GLOB_RECURSE INCLUDES CONFIGURE_DEPENDS main.cpp filesystem/*.cpp flatset/*.cpp fem/*.cpp )
add_executable(Fight "${INCLUDES}")

# Adding deal.II dependency 

find_package(deal.II 9.5.0 REQUIRED HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR})

deal_ii_initialize_cached_variables()
deal_ii_setup_target(Fight)

# Including target link for Boost

find_package(Boost REQUIRED COMPONENTS filesystem)
target_link_libraries(Fight Boost::boost Boost::filesystem)