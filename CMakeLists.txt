cmake_minimum_required(VERSION 3.22)

project(
  freertos_demo
  VERSION 0.1.0
  LANGUAGES C CXX ASM)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(PROJECT_IS_TOP_LEVEL ON)
else()
  set(PROJECT_IS_TOP_LEVEL OFF)
endif()

if(NOT PROJECT_IS_TOP_LEVEL)
  set_directory_properties(PROPERTIES EXCLUDE_FROM_ALL ON)
endif()

if(CONFIG_POSIX_GCC)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/hello")
elseif(CONFIG_PIC32MZ)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/PIC32MZ_MPLAB")

  set(CMAKE_C_COMPILER "/opt/microchip/xc32/v${XC32_VERSION}/bin/xc32-gcc")
  set(CMAKE_ASM_COMPILER "/opt/microchip/xc32/v${XC32_VERSION}/bin/xc32-as")
  # Assembly options
  set(CMAKE_ASM_FLAGS "${CFLAGS} -Wa,--defsym=__MPLAB_BUILD=1,--gdwarf-2")

  set(CMAKE_SYSTEM_NAME FreeRTOS)
  set(TOOLCHAIN_PREFIX xc32)

  # cross compilers to use for C, C++ and Fortran
  set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
  set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)

  # target environment on the build host system
  set(CMAKE_FIND_ROOT_PATH /opt/microchip/xc32/v${XC32_VERSION}/bin/)

  # modify default behavior of FIND_XXX() commands
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

  # set(PIC 32MZ2048EFM144)
  set(OPTIMIZATION 1)
  set(USER_FLAGS -Wall)
  set(USER_DEFINITIONS)
  set(HEAP 0)

  set(CMAKE_ASM_FLAGS "${CFLAGS} -Wa,--defsym=__MPLAB_BUILD=1,--gdwarf-2")
  # Compiler flags and options
  set(MPROCESSOR -mprocessor=32MZ2048EFM144) # ${PIC_NAME})
  set(MOPTIMIZATION -O${OPTIMIZATION})
  set(DEFINES ${USER_DEFINITIONS})
  set(SYM_HEAP --defsym=_min_heap_size=${HEAP})
  set(SYM_BUILD --defsym=__MPLAB_BUILD=1)
  set(LINKER_OPTS --gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem)
  set(LINKER_MAP -Map=${CMAKE_CURRENT_BINARY_DIR}/demo_hello.map)
  set(MEMORY_FILE --memorysummary,${CMAKE_CURRENT_BINARY_DIR}/memoryfile.xml)

  set(XC32_LINK_FLAGS
      ${SYM_HEAP},${SYM_BUILD},${LINKER_OPTS},${LINKER_MAP},${MEMORY_FILE})

elseif(CONFIG_MINGW)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/hello")
  # set(CMAKE_C_COMPILER "/usr/bin/x86_64-w64-mingw32-gcc")
  # set(CMAKE_ASM_COMPILER "/usr/bin/x86_64-w64-mingw32-as")
  # include_directories("/usr/x86_64-w64-mingw32/include/")

  # Sample toolchain file for building for Windows from an Ubuntu Linux system.
  #
  # Typical usage: *) install cross compiler: `sudo apt-get install mingw-w64`
  # *) cd build *) cmake -DCMAKE_TOOLCHAIN_FILE=~/mingw-w64-x86_64.cmake .. This
  # is free and unencumbered software released into the public domain.

  set(CMAKE_SYSTEM_NAME Windows)
  set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)

  # cross compilers to use for C, C++ and Fortran
  set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
  set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)

  # target environment on the build host system
  set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

  # modify default behavior of FIND_XXX() commands
  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

endif()

add_library(freertos_config INTERFACE)
target_include_directories(freertos_config SYSTEM
                           INTERFACE ${FREE_RTOS_CFG_DIR})

target_compile_definitions(freertos_config INTERFACE projCOVERAGE_TEST=1)
# target_compile_definitions(freertos_config INTERFACE __PIC32MZ__)

include(dependencies.cmake)

add_subdirectory(src)
