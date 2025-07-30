#!/bin/bash
# This script automates the eBPF compilation process using the CO-RE method.

# Exit immediately if any command fails
set -e

# Step 1: Generate the vmlinux.h header.
# This file contains all kernel type information your eBPF program needs,
# making it independent of system-wide kernel headers.
echo "=> Generating vmlinux.h from kernel BTF..."
bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

# Step 2: Compile the eBPF C code into an object file.
# We use clang with the BPF target. The '-g' flag includes debug information,
# which is useful for loading the program.
echo "=> Compiling eBPF code..."
clang -g -O2 -target bpf -c hello_kern.c -o hello_kern.o

echo "✅ Build successful! Your eBPF program is compiled into hello_kern.o"
