set(CMAKE_SYSTEM_NAME FreeRTOS)
set(XC32_TOOLCHAIN_PATH "/opt/microchip/xc32/v${XC32_VERSION}/bin/")
set(DFP_PATH
    "/opt/microchip/mplabx/v${MPLABX_VERSION}/packs/Microchip/${DFP}/${DFP_VERSION}"
)
set(TOOLCHAIN_PREFIX "xc32")

# cross compilers to use for C, C++ and Fortran
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PREFIX}-gcc")
set(CMAKE_C_COMPILER "${TOOLCHAIN_PREFIX}-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PREFIX}-g++")

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH "/opt/microchip/xc32/v${XC32_VERSION}/bin/")

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# TODO: Cleanup, shouldn't have these defined here, should be target specific
set(OPTIMIZATION 1)
set(USER_FLAGS)
set(USER_DEFINITIONS)
set(HEAP 4)

set(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} -mprocessor=${PIC} -fdata-sections -ffunction-sections -no-legacy-libc"
)

set(CMAKE_ASM_FLAGS "${CFLAGS}
      -Wa,--defsym=__MPLAB_BUILD=1,--gdwarf-2")
# Compiler flags and options
set(MPROCESSOR "-mprocessor=${PIC}") 
set(MOPTIMIZATION "-O${OPTIMIZATION}")
set(DEFINES "${USER_DEFINITIONS}")
set(SYM_HEAP "--defsym=_min_heap_size=${HEAP}")
set(SYM_BUILD "--defsym=__MPLAB_BUILD=1")
set(LINKER_OPTS "--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem")
# TODO: shouldn't reference a target name here... needs cleanup
set(LINKER_MAP "-Map=${CMAKE_CURRENT_BINARY_DIR}/target.map")
set(MEMORY_FILE "--memorysummary,${CMAKE_CURRENT_BINARY_DIR}/memoryfile.xml")

set(XC32_LINK_FLAGS
    "${SYM_HEAP},${SYM_BUILD},${LINKER_OPTS},${LINKER_MAP},${MEMORY_FILE}")
