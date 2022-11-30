cmake_minimum_required(VERSION 3.13)  
project("wagnerln_cmake_exercise")

find_package(Boost 1.71 REQUIRED COMPONENTS
             container filesystem)

find_package(deal.II 9.1.1 REQUIRED
    HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES()

find_package(yaml-cpp REQUIRED CONFIG)

# Add executable target with source files listed in SOURCE_FILES variable
add_executable(wagnerln_cmake_exercise_executable "main.cpp" "flatset/flatset.cpp" "filesystem/filesystem.cpp" "fem/fem.cpp")
target_link_libraries(wagnerln_cmake_exercise_executable Boost::container Boost::filesystem)
DEAL_II_SETUP_TARGET(wagnerln_cmake_exercise_executable)

install(TARGETS wagnerln_cmake_exercise_executable)