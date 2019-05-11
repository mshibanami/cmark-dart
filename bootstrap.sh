#!/usr/bin/env bash

set -ex
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit
CMARK_DIR="./lib/src/cmark"
CMARK_BUILD_DIR="${CMARK_DIR}/lib/src/cmark/build"

git submodule update --init --recursive
mkdir -p $CMARK_BUILD_DIR
cmake ${CMARK_DIR} -B $CMARK_BUILD_DIR
make --directory=$CMARK_BUILD_DIR
