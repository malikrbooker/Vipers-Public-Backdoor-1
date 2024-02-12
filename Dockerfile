# File:         DockerFile

# Created by:   VPR
# Created:      February 12th, 2024

# Updated by:   VPR
# Updated:      February 12th, 2024

FROM ubuntu:22.04

# Set env to avoid user input interruption during installation
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install required packages
RUN apt-get update && apt upgrade -y
RUN apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    build-essential \
    vim \
    mingw-w64 \
    mingw-w64-common \
    mingw-w64-i686-dev \
    mingw-w64-x86-64-dev \
    mingw-w64-tools

# Create working environment
USER root
ENV HOME=/root
WORKDIR /var/concept-dev/concept

# Install & configure Rust
RUN update-ca-certificates
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup install nightly
RUN rustup default nightly
RUN rustup target add x86_64-pc-windows-gnu --toolchain nightly
# RUN cargo build -Z build-std --target x86_64-pc-windows-gnu
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
