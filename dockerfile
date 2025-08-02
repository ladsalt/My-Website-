# Use an existing Manjaro base image from Docker Hub
FROM manjarolinux/darch-manjaro:latest



RUN pacman -S curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
RUN pacman -S nodejs npm
RUN npm install -g rust-just

RUN bash

# set up everything for the website
COPY src .
COPY content .
COPY justfile .

RUN mkdir build

RUN just build


# Copy application files into the image (optional)
# COPY . /app

# Define the command to run when the container starts
CMD ["/bin/bash"]
