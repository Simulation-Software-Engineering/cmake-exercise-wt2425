cmake_minimum_required(VERSION 3.10)

project(FightCMakeDocker)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(
    ${CMAKE_SOURCE_DIR}/flatset
    ${CMAKE_SOURCE_DIR}/filesystem
    ${CMAKE_SOURCE_DIR}/fem
)

# Find Boost filesystem
find_package(Boost REQUIRED COMPONENTS filesystem)

# Find deal.II
find_package(deal.II REQUIRED HINTS /usr/share/cmake/deal.II)

# Initialize deal.II cached variables
deal_ii_initialize_cached_variables()

# Add the executable
add_executable(main main.cpp flatset/flatset.cpp filesystem/filesystem.cpp fem/fem.cpp)

# Use deal.II's setup macro to configure the target
deal_ii_setup_target(main)

# Link Boost filesystem using plain signature
target_link_libraries(main Boost::filesystem)
