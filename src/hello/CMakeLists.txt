# FreeRTOS Demo ----------------------------------------------------------------
# Demonstrate building a simple FreeRTOS application for a target and host
# environment.
#
# Target a Microchip, x86 GNU/Linux, and x86 MSVC-MinGW environment.

add_executable(demo_hello hello.cpp)

target_link_libraries(demo_hello freertos_kernel)

if(CONFIG_PIC32MZ)
  target_compile_options(
    demo_hello
    PUBLIC ${USER_FLAGS}
           ${MPROCESSOR}
           ${MOPTIMIZATION}
           -fdata-sections
           -ffunction-sections
           -no-legacy-libc
           -mdfp=${DFP})
  target_compile_definitions(demo_hello PUBLIC XPRJ_default=default ${DEFINES})
  target_link_options(demo_hello PUBLIC ${MPROCESSOR} ${MOPTIMIZATION})
  target_link_libraries(demo_hello "-Wl,${XC32_LINK_FLAGS}" freertos_kernel)
endif()
