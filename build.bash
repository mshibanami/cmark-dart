#!/usr/bin/env bash

set -ex
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit

CMAKE_BUILD_DIR="./cmark/build"

git submodule update --init --recursive
mkdir -p $CMAKE_BUILD_DIR
cmake ./cmark -B $CMAKE_BUILD_DIR
make --directory=$CMAKE_BUILD_DIR
