# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

# Steps to run the code

- Make sure docker is running.

- Build the docker image:
cd cmake-exercise-wt2425
docker build -t <name of the image> .

- Run the docker container to execute the script and get the output.
docker run <name of the image>

Note: 
If you want to execute into the container to do some testing. You can use the following command.
docker exec -it <name of the image> /bin/bash