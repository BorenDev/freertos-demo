# set(CMAKE_C_COMPILER "/usr/bin/x86_64-w64-mingw32-gcc") set(CMAKE_ASM_COMPILER
# "/usr/bin/x86_64-w64-mingw32-as")
# include_directories("/usr/x86_64-w64-mingw32/include/")

# Sample toolchain file for building for Windows from an Ubuntu Linux system.
#
# Typical usage: *) install cross compiler: `sudo apt-get install mingw-w64` *)
# cd build *) cmake -DCMAKE_TOOLCHAIN_FILE=~/mingw-w64-x86_64.cmake .. This is
# free and unencumbered software released into the public domain.

set(CMAKE_SYSTEM_NAME Windows)
set(TOOLCHAIN_PREFIX "x86_64-w64-mingw32")

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# TODO: Cleanup, shouldn't have these defined here, should be target specific
set(OPTIMIZATION 1)
set(USER_FLAGS)
set(USER_DEFINITIONS)
set(HEAP 4)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -fdata-sections -ffunction-sections")

set(CMAKE_ASM_FLAGS "${CFLAGS}
        -Wa,--defsym=__MPLAB_BUILD=1,--gdwarf-2")
# Compiler flags and options
set(MPROCESSOR "") # ${PIC_NAME})
set(MOPTIMIZATION "-O${OPTIMIZATION}")
set(DEFINES "${USER_DEFINITIONS}")
set(SYM_HEAP "--defsym=_min_heap_size=${HEAP}")
set(SYM_BUILD "--defsym=__MPLAB_BUILD=1")
set(LINKER_OPTS "--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem")
set(MEMORY_FILE "--memorysummary,${CMAKE_CURRENT_BINARY_DIR}/memoryfile.xml")

set(XC32_LINK_FLAGS
    "${SYM_HEAP},${SYM_BUILD},${LINKER_OPTS},${LINKER_MAP},${MEMORY_FILE}")
