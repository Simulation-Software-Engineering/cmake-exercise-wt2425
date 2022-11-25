# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

## Instructions

### Clone Repository

> git clone https://github.com/seinan9/cmake-exercise-wt2223.git

### Build Docker Image

> cd cmake-exercise-wt2223/

> docker build -t cmake-container .

### Run Docker Image (Interactive Mode)

> docker run -it cmake-container

### Build and Execute

> build (alias for mkdir build && cd build && cmake ..)

> make 

> ./cmake_exercise

### Some Aliases for Convenience 

The parent directory can be reached via
> .. (alias for cd ..)

The build folder can be removed via
> rmb (alias for rm -rf build)

