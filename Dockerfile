from debian:bookworm-slim

workdir /root

run apt-get update && apt-get install -y wget xz-utils

run wget https://github.com/marler8997/zigup/releases/download/v2024_05_05/zigup-x86_64-linux.tar.gz && \
    tar xvf zigup-x86_64-linux.tar.gz && \
    mv zigup /bin

run /bin/zigup 0.13.0
