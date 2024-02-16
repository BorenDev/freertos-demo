
DOCKER_CMD = podman run -it --rm --name=build_container --mount type=bind,source=${PWD},target=/src arch_mplabx:latest bash
SHELL_CMD = podman run -it --rm --name=shell --mount type=bind,source=${PWD},target=/src arch_mplabx:latest bash

all: \
	blinky_posix_gcc \
	blinky_win32_mingw \
	blinky_pic32mz2048efm144

blinky_posix_gcc:
	$(DOCKER_CMD) cmake_build.sh blinky_posix_gcc

blinky_win32_mingw:
	$(DOCKER_CMD) cmake_build.sh blinky_win32_mingw

blinky_pic32mz2048efm144:
	$(DOCKER_CMD) cmake_build.sh blinky_pic32mz2048efm144

shell:
	$(SHELL_CMD)

clean:
	rm -rf build/
