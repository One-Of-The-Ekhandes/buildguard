# BuildGuard

[![CI](https://github.com/One-Of-The-Ekhandes/buildguard/actions/workflows/ci.yml/badge.svg)](https://github.com/One-Of-The-Ekhandes/buildguard/actions/workflows/ci.yml)

BuildGuard is a small build-and-test harness designed to make builds repeatable.

It focuses on one principle: a build should start from a clean state and either succeed clearly or fail clearly.

## What it does

- removes previous build artifacts
- rebuilds a small C program from source with warnings enabled (`-O2 -Wall -Wextra -std=c11`)
- runs a validation step that checks the binary exists and prints the expected output
- returns explicit exit codes for automation: `0` means success, anything else fails the CI step

Both scripts run with `set -euo pipefail`, so they stop on the first failing command, on an unset variable, or on a failure inside a pipeline.

## Build

```bash
./build.sh
```

## Test

```bash
./test.sh
echo $?   # 0 on success, 1 on failure
```

## Use in CI

The included GitHub Actions workflow runs `./build.sh` and `./test.sh` on every push. Any CI system works the same way, because it only relies on exit codes:

```groovy
// Jenkinsfile
pipeline {
    agent { label 'linux' }
    options { timeout(time: 5, unit: 'MINUTES') }
    stages {
        stage('Build') { steps { sh './build.sh' } }
        stage('Test')  { steps { sh './test.sh' } }
    }
}
```
