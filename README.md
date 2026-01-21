# BuildGuard

BuildGuard is a small build-and-test harness designed to make builds repeatable.

It focuses on one principle:  
a build should start from a clean state and either succeed clearly or fail clearly.

## What it does
- removes previous build artifacts
- rebuilds a small program from source
- runs a simple validation step
- returns explicit exit codes for automation

## Build
```bash
./build.sh
