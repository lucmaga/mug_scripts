#!/bin/bash
# For Fedora33.

dnf install -y gcc \
	       gdb \
	       libtool \
	       flex \
	       bison \
	       gawk \
	       pandoc \
	       tmux \
	       make \
	       bc \
	       autoconf \
	       automake \
	       texinfo \
	       time \
	       valgrind \
	       wget \
	       python3 \
	       git \

mkdir src
git clone https://sourceware.org/git/glibc.git src/glibc

