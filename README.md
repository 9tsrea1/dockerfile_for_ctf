# Dockerfile for Mac Solving CTF Reverse Engineering and Cryptography Challenges

## Overview

This dockerfile is which I use to solve CTF challenges. Especially for **Reverse Engineer** and **Cryptography**. I'm using a Macbook and it takes some time for me to use some libraries and tools successfully. Finally I found this way using docker can work stably.

## System

Linux Ubuntu 22.04

## Key Tools Included (A-Z)

binwalk  
decompyle3  
exiftool  
frida  
GDB  
gmpy2  
ltrace  
pillow  
pwntools  
pycdas  
pycdc  
pycryp  
todome  
ruby-full  
sagemath  
steghide  
strace  
sympy  
uncompyle6  
UPX  
z3-solver  
zsteg  

## Quick Start

### 1. Build the Image
Clone the repository and build the container image:
```bash
docker build -t linux-env .
```

> **Note**: To force an update of all upstream repositories and packages without using cache:
> ```bash
> docker build --no-cache -t linux-env .
> ```

### 2. Run the Container
Start an interactive shell and mount your current working directory to `/workspace`:
```bash
docker run --rm -it -v $(pwd):/workspace linux-env
```

---

## Mount & Persistence Notice
Files created or modified inside `/workspace` are mirrored directly onto the host machine. Exiting the container (`exit`) will clean up the temporary instance via `--rm`, while preserving all host-mounted artifacts