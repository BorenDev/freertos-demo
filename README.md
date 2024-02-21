# freertos-demo
Demonstrate project definition using CMake for a target and a host platform.

## Requires

By default this project is built using a build container that has all the necessary tools installed to build a posix_gcc, win32_mingw, and PIC32MZ FreeRTOS executable.

Assuming podman or docker is installed on the system, the only requirement is GNU Make.  The commands executed by the Makefile can also be executed by hand.

Assuming a build container environment is not available, the following is required to build:

- cmake
- ninja
- mingw gcc toolchain (windows)
- gcc (native linux)
- xc32
- mplabx ide
- PIC32MZ atpack for the PIC32MZ
