
add_library(blinky STATIC blinky.c)
target_link_libraries(blinky PUBLIC freertos_kernel)
