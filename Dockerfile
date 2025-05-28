# Este Dockerfile define un container con gcc y qemu para poder correr
FROM debian:bookworm-slim AS build-env
WORKDIR /root/

RUN apt-get update && apt-get -y install \
    git \
    gcc-aarch64-linux-gnu \
    build-essential \
    python \
    pkg-config \
    zlib1g-dev \
    libglib2.0-dev \
    libpixman-1-dev \
    qemu-system-arm

WORKDIR /local
ENTRYPOINT ["/bin/bash"]
