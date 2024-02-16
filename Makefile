
DOCKER_CMD = podman run -it --rm --name=build_container --mount type=bind,source=${PWD},target=/src arch_mplabx:latest bash
SHELL_CMD = podman run -it --rm --name=shell --mount type=bind,source=${PWD},target=/src arch_mplabx:latest bash

all: demo_mingw demo_posix demo_pic32mz

demo_mingw:
	$(DOCKER_CMD) cmake_build.sh demo_mingw

demo_posix:
	$(DOCKER_CMD) cmake_build.sh demo_posix

demo_pic32mz:
	$(DOCKER_CMD) cmake_build.sh demo_pic32mz

shell:
	$(SHELL_CMD)

clean:
	rm -rf build/
