FROM ubuntu:22.04

COPY inittimezone /usr/local/bin/inittimezone
RUN chmod +x /usr/local/bin/inittimezone
RUN inittimezone

RUN apt update -y && apt upgrade -y
RUN apt install -y build-essential cmake git vim

WORKDIR /usr/src/app

RUN git clone https://github.com/seinan9/cmake-exercise-wt2223.git

CMD ["/bin/bash"]

