FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 python3-pip ruby-full openjdk-17-jdk \
    build-essential gdb gcc g++ \
    git curl wget unzip \
    exiftool upx-ucl steghide \
    netcat-openbsd tcpdump nmap \
    strace ltrace \
    texlive-base \
    meson ninja-build pkg-config libuv1-dev libssl-dev libcap-dev \
    sagemath \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir pwntools requests z3-solver binwalk pillow pycryptodome sympy \
    frida frida-tools gmpy2 uncompyle6 decompyle3

RUN git clone https://github.com/zrax/pycdc.git /opt/pycdc \
    && cd /opt/pycdc \
    && mkdir build && cd build \
    && cmake .. \
    && make -j$(nproc) \
    && cp pycdc pycdas /usr/local/bin/

RUN gem install zsteg

WORKDIR /workspace

CMD ["bash"]
