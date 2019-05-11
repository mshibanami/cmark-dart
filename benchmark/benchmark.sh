#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit

BENCHMARK_BUILD_DIR="./build"
mkdir -p $BENCHMARK_BUILD_DIR

g++ -std=c++11 -g ./benchmark_cmark_native.cc -o $BENCHMARK_BUILD_DIR/benchmark_cmark_native
$BENCHMARK_BUILD_DIR/benchmark_cmark_native

dart benchmark.dart
