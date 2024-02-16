set(SOURCES
    main.c
    Run-time-stats-utils.c
    code_coverage_additions.c
    )

set(TARGET_NAME "win32_example")

add_executable(${TARGET_NAME} ${SOURCES})
target_link_libraries(${TARGET_NAME} freertos_kernel blinky)
target_include_directories(${TARGET_NAME} PUBLIC .)
target_compile_definitions(${TARGET_NAME} PUBLIC USER_DEMO=0)
