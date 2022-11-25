cmake_minimum_required(VERSION "3.12")

project("cmake_exercise")

add_library(flatset flatset/flatset.cpp)
add_library(filesystem filesystem/filesystem.cpp)

find_package(Boost REQUIRED COMPONENTS filesystem)
if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})
endif()

add_executable(cmake_exercise main.cpp)

target_link_libraries(cmake_exercise PRIVATE flatset)
target_link_libraries(cmake_exercise PRIVATE filesystem)
target_link_libraries(cmake_exercise PRIVATE ${Boost_LIBRARIES} Boost::filesystem)
