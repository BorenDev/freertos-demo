# FreeRTOS Demo ----------------------------------------------------------------
# Demonstrate building a simple FreeRTOS application for a target and host
# environment.
#
# Target a Microchip, x86 GNU/Linux, and x86 MSVC-MinGW environment.

add_executable(demo_hello hello.cpp)

target_link_libraries(demo_hello freertos_kernel)
