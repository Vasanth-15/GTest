FROM ubuntu:16.04

RUN apt-get update && apt-get install -y g++ libgtest-dev cmake make bash
RUN mkdir -p /usr/scripts

COPY ./* /usr/scripts/
WORKDIR /usr/src/gtest

RUN cmake CMakeLists.txt && make && cp *.a /usr/lib

WORKDIR /usr/scripts

CMD ["bash", "run.sh"]
