#!/usr/bin/env bash
set -ex
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit

BENCHMARK_BUILD_DIR="./build"
mkdir -p $BENCHMARK_BUILD_DIR

g++-8 -g ./benchmark_cmark_native.cc -o $BENCHMARK_BUILD_DIR/benchmark_cmark_native
$BENCHMARK_BUILD_DIR/benchmark_cmark_native

dart benchmark.dart
