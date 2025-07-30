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

Use the `build.sh` script to compile the eBPF program.

```bash
chmod +x build.sh
./build.sh
```

This will produce the `hello_kern.o` object file.

## Loading and Running with bpftool

You can use `bpftool` to load, run, and manage the eBPF program.

1.  **Load the Program:**
    Use the following command to load the object file and attach the program to the `sys_enter_execve` tracepoint.

    ```bash
    sudo bpftool prog load hello_kern.o /sys/fs/bpf/hello
    sudo bpftool prog attach pinned /sys/fs/bpf/hello tracepoint syscalls/sys_enter_execve
    ```

2.  **View the Output:**
    Open another terminal and read the kernel's trace pipe to see the output.

    ```bash
    sudo cat /sys/kernel/debug/tracing/trace_pipe
    ```
    You should see the "Hello, eBPF World!" message each time a new command is executed.

3.  **Unload the Program:**
    When you are finished, you can detach and unload the program using `bpftool`.

    ```bash
    sudo bpftool prog detach pinned /sys/fs/bpf/hello tracepoint syscalls/sys_enter_execve
    sudo rm /sys/fs/bpf/hello
    ```
