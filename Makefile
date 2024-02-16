
DOCKER_CMD = podman run -it --rm --name=build_container --mount type=bind,source=${PWD},target=/src arch_mplabx:latest bash
SHELL_CMD = podman run -it --rm --name=shell --mount type=bind,source=${PWD},target=/src arch_mplabx:latest bash

all: mingw posix pic32mz

mingw:
	$(DOCKER_CMD) cmake_build.sh mingw

posix:
	$(DOCKER_CMD) cmake_build.sh posix

pic32mz:
	$(DOCKER_CMD) cmake_build.sh pic32mz

shell:
	$(SHELL_CMD)

clean:
	rm -rf build/
