cmake_minimum_required(VERSION "3.12")

project("cmake_exercise")

find_package(Boost REQUIRED COMPONENTS filesystem)
if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})
endif()

find_package(deal.II REQUIRED)
deal_ii_initialize_cached_variables()

add_library(flatset flatset/flatset.cpp)

add_library(filesystem filesystem/filesystem.cpp)

add_library(fem fem/fem.cpp)
deal_ii_setup_target(fem)

add_executable(cmake_exercise main.cpp)

deal_ii_setup_target(cmake_exercise)

target_link_libraries(cmake_exercise flatset)

target_link_libraries(cmake_exercise filesystem)

target_link_libraries(cmake_exercise ${Boost_LIBRARIES} Boost::filesystem)

target_link_libraries(cmake_exercise fem)
