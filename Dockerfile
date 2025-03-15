FROM debian:latest

# COPY main.py /home/debian
# CMD ["echo", "hello world"]
RUN ["apt-get", "update"]
RUN ["apt-get", "upgrade", "-y"]
RUN ["apt-get", "install", "git", "-y"]

WORKDIR /home/debian
