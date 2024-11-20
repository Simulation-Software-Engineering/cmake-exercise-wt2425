# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

### Build instructions

Open this repository in VSCode, type Ctrl + Shift + P and enter: "Dev Containers: Reopen in Container"

The process of building the container takes a while.
When finished, VSCode is opened inside the container and the files of the repository are mounted under `/workspaces/cmake-exercise-wt2425`.

The project can be built with CMake and Make:

`mkdir build`
`cd build`
`cmake .. && make`

The program can be executed with: `./cmake-exercise` in the `build` directory.
