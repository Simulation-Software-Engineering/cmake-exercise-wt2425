#setup
cmake_minimum_required(VERSION 3.13)  
project("wagnerln_cmake_exercise")

#find Packages Boost, deal.II and yaml-cpp
find_package(Boost 1.71 REQUIRED COMPONENTS
             container filesystem)

find_package(deal.II 9.1.1 REQUIRED
    HINTS ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
)
DEAL_II_INITIALIZE_CACHED_VARIABLES() #deal.II magic

find_package(yaml-cpp REQUIRED)

#find all source files and add them to the executable
file(GLOB SOURCE_FILES  "*.cpp" "**/*.cpp" "**/*.h") 
add_executable(wagnerln_cmake_exercise_executable ${SOURCE_FILES})

#link libraries
target_link_libraries(wagnerln_cmake_exercise_executable Boost::container Boost::filesystem  yaml-cpp)
DEAL_II_SETUP_TARGET(wagnerln_cmake_exercise_executable)

#add make install rule
install(TARGETS wagnerln_cmake_exercise_executable)