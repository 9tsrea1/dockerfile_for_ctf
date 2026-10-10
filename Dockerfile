FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \ 
    exiftool \
    g++ \
    gcc \
    gdb \
    git \
    libcap-dev \
    libssl-dev \
    libuv1-dev \
    ltrace \
    meson \
    netcat-openbsd \
    ninja-build \
    nmap \
    openjdk-17-jdk \
    pkg-config \
    python3 \
    python3-pip \
    ruby-full \
    sagemath \
    steghide \
    strace \
    tcpdump \
    texlive-base \
    unzip \
    upx-ucl \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    binwalk \
    decompyle3 \
    frida \
    frida-tools \
    gmpy2 \
    pillow \
    pwntools \
    pycryptodome \
    requests \
    sympy \
    uncompyle6 \
    z3-solver

RUN git clone https://github.com/zrax/pycdc.git /opt/pycdc \
    && cd /opt/pycdc \
    && mkdir build && cd build \
    && cmake .. \
    && make -j$(nproc) \
    && cp pycdc pycdas /usr/local/bin/

RUN gem install zsteg

WORKDIR /workspace

CMD ["bash"]
