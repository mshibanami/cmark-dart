#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE:-$0}")" || exit

g++ -std=c++11 -g main.cpp -o main
