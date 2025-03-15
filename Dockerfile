FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install man -y
RUN apt-get install sudo -y
RUN apt-get install tree -y

# Add debian user and set sudo.
RUN useradd -rm -d /home/debian -s /bin/bash -g root -G sudo debian
RUN echo "debian ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/debian
USER debian

WORKDIR /home/debian

