#!/bin/bash

cmake --preset $1
cmake --build --preset $1
# cmake --trace-expand -B build/pic32mz
