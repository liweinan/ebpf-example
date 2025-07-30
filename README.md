# Hello World eBPF Example (eunomia-bpf)

This project is a simple "Hello World" eBPF example based on the [eunomia-bpf developer tutorial](https://github.com/eunomia-bpf/bpf-developer-tutorial/blob/main/src/1-helloworld/README.md).

It uses the `eunomia-bpf` toolchain to simplify the process of compiling, loading, and running eBPF programs.

## Quick Start with `ecc` and `ecli`

The easiest way to run this example is by using the pre-compiled `ecc` compiler and `ecli` runner.

1.  **Download the tools:**
    ```bash
    # Download the compiler
    wget https://github.com/eunomia-bpf/eunomia-bpf/releases/latest/download/ecc
    chmod +x ./ecc

    # Download the runner
    wget https://github.com/eunomia-bpf/eunomia-bpf/releases/latest/download/ecli
    chmod +x ./ecli
    ```

2.  **Build the eBPF program:**
    The `ecc` tool compiles the C source code into a `package.json` file, which bundles the eBPF bytecode and metadata.
    ```bash
    ./ecc hello_kern.c
    ```

3.  **Run the eBPF program:**
    The `ecli` tool runs the program defined in the generated `package.json`.
    ```bash
    sudo ./ecli run package.json
    ```

4.  **View the Output:**
    In another terminal, you can view the output from the eBPF program by reading the kernel's trace pipe:
    ```bash
    sudo cat /sys/kernel/debug/tracing/trace_pipe
    ```
    You will see "Hello, eBPF World!" messages every time a new program is executed on the system.

5.  **Stop the Program:**
    Press `Ctrl-C` in the terminal where `ecli` is running to stop the program.

## Manual Development Setup

If you want to build the project from source or develop eBPF programs locally without using the pre-compiled tools, you will need to install the necessary development toolchain.

1.  **Install Dependencies:**
    The `pre-install.sh` script will install `clang`, `llvm`, `libbpf-dev`, and other required tools on a Debian-based system.
    ```bash
    chmod +x pre-install.sh
    sudo ./pre-install.sh
    ```
2.  **Build and Run:**
    After installing the dependencies, you can use tools like `clang` and `bpftool` to manually build and run the eBPF code, or build the `ecc` and `ecli` tools from source.
