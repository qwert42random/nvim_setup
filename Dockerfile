FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN useradd -rm -d /home/debian -s /bin/bash -g root -G root -u 1001 debian

USER debian

WORKDIR /home/debian

