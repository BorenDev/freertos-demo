#!/bin/bash

podman run -it --rm --name=build_container --mount type=bind,source=${PWD}/../../..,target=/src arch_mplabx:latest bash make_build.sh
#podman run -it --rm --name=build_container --mount type=bind,source=${PWD},target=/src arch_mplabx:latest ./build/posix_demo
