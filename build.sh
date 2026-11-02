#!/usr/bin/env bash
set -euo pipefail

# ensure clean environment
rm -rf build
mkdir build

cc -O2 -Wall -Wextra -std=c11 hello.c -o build/hello

echo "build successful"
