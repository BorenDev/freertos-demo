set(SOURCES console.c main.c)

set(TARGET_NAME "posix_example")

add_executable(${TARGET_NAME} ${SOURCES})
target_link_libraries(${TARGET_NAME} freertos_kernel blinky)
target_include_directories(${TARGET_NAME} PUBLIC .)
