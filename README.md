# eBPF Example

This project provides a simple eBPF "Hello World" example that demonstrates the modern CO-RE (Compile Once - Run Everywhere) development approach.

## Prerequisites

This project is designed for Debian-based Linux distributions (like Ubuntu).

## Setup

1.  **Install Dependencies:**
    Run the `pre-install.sh` script to install all the necessary packages for eBPF development.

    ```bash
    chmod +x pre-install.sh
    sudo ./pre-install.sh
    ```

## Building the eBPF Program

1.  **Compile the Code:**
    Use the `build.sh` script to compile the eBPF program. This script will first generate the required `vmlinux.h` header and then build the C code.

    ```bash
    chmod +x build.sh
    ./build.sh
    ```

    If successful, this will produce an object file named `hello_kern.o`.

## Loading and Running

After building, you can load the `hello_kern.o` file into the kernel using an eBPF loader program (not included in this example). Once loaded, the program will print "Hello, eBPF World!" to the kernel trace pipe every time a new program is executed on the system.

You can view the output by reading the trace pipe:
```bash
sudo cat /sys/kernel/debug/tracing/trace_pipe
