#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

// 定义许可证（必需）
char _license[] SEC("license") = "GPL";

// eBPF 程序：每次调用 sys_execve 时触发
SEC("tracepoint/syscalls/sys_enter_execve")
int hello(void *ctx) {
    char msg[] = "Hello, eBPF World!";
    bpf_trace_printk(msg, sizeof(msg)); // 输出到 trace_pipe
    return 0;
}
