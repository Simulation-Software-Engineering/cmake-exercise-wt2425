FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt upgrade -y
RUN apt install -y build-essential cmake git vim

# Install Boots library
RUN apt install -y libboost-all-dev

# Install deal.II library
RUN apt install -y libdeal.ii-dev

# Add some aliases for convenience
RUN echo "alias build='mkdir build && cd build && cmake ..'" >> ~/.bashrc 
RUN echo "alias rmb='rm -rf build'" >> ~/.bashrc
RUN echo "alias ..='cd ..'" >> ~/.bashrc

COPY . ./usr/src/app/cmake-exercise-wt2223/

# Set working directory
WORKDIR /usr/src/app/cmake-exercise-wt2223

CMD ["/bin/bash"]
