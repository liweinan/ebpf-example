#!/bin/bash
# This script installs all the prerequisite packages for eBPF development.

# Exit immediately if any command fails
set -e

# Update package lists
sudo apt-get update

# Install essential build tools and eBPF-related packages
echo "=> Installing development tools and eBPF libraries..."
sudo apt-get install -y build-essential clang llvm libelf-dev libbpf-dev linux-tools-common linux-tools-generic

echo "✅ All prerequisites installed successfully."
