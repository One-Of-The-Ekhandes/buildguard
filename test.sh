#!/usr/bin/env bash
set -euo pipefail

if [ ! -x build/hello ]; then
  echo "binary not found"
  exit 1
fi

output=$(./build/hello)

if [ "$output" != "hello" ]; then
  echo "unexpected output"
  exit 1
fi

echo "test passed"
