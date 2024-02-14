#!/bin/bash

podman run -it --rm --name=example --replace \
	--mount type=bind,source=${PWD},target=/src \
	arch_mplabx:latest \
	bash
