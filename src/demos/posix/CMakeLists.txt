set(SOURCES
    code_coverage_additions.c
    console.c
    main.c
    main_blinky.c
    main_full.c
    run-time-stats-utils.c
    ../Common/Minimal/AbortDelay.c
    ../Common/Minimal/BlockQ.c
    ../Common/Minimal/EventGroupsDemo.c
    ../Common/Minimal/GenQTest.c
    ../Common/Minimal/IntSemTest.c
    ../Common/Minimal/MessageBufferAMP.c
    ../Common/Minimal/MessageBufferDemo.c
    ../Common/Minimal/PollQ.c
    ../Common/Minimal/QPeek.c
    ../Common/Minimal/QueueOverwrite.c
    ../Common/Minimal/QueueSet.c
    ../Common/Minimal/QueueSetPolling.c
    ../Common/Minimal/StaticAllocation.c
    ../Common/Minimal/StreamBufferDemo.c
    ../Common/Minimal/StreamBufferInterrupt.c
    ../Common/Minimal/TaskNotify.c
    ../Common/Minimal/TimerDemo.c
    ../Common/Minimal/blocktim.c
    ../Common/Minimal/countsem.c
    ../Common/Minimal/death.c
    ../Common/Minimal/dynamic.c
    ../Common/Minimal/flop.c
    ../Common/Minimal/integer.c
    ../Common/Minimal/recmutex.c
    ../Common/Minimal/semtest.c)

set(TARGET_NAME "posix_demo")

add_executable(${TARGET_NAME} ${SOURCES})
target_link_libraries(${TARGET_NAME} freertos_kernel)
target_include_directories(${TARGET_NAME} PUBLIC ../Common/include .)
target_compile_definitions(${TARGET_NAME} PUBLIC USER_DEMO=0)
