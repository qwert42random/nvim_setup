FROM debian:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install man -y
RUN apt-get install sudo -y
RUN apt-get install tree -y
RUN apt-get install xclip -y
RUN apt-get install zip -y

# Add debian user and set sudo.
RUN useradd -rm -d /home/debian -s /bin/bash -g root -G sudo debian
RUN echo "debian ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/debian
USER debian

# Copy install file and run it.
COPY ./install /tmp/install
RUN ./tmp/install/install_script.sh

WORKDIR /home/debian

