set(SOURCES
    ConfigPerformance.c
    ISRTriggeredTask.c
    ISRTriggeredTask_isr.S
    IntQueueTimer.c
    IntQueueTimer_isr.S
    ParTest/ParTest.c
    RegisterTestTasks.S
    flop_mz.c
    main.c
    main_blinky.c
    main_full.c
    timertest.c
    timertest_isr.S
    ../Common/Minimal/GenQTest.c
    ../Common/Minimal/QPeek.c
    ../Common/Minimal/blocktim.c
    ../Common/Minimal/flash_timer.c
    ../Common/Minimal/semtest.c
    ../Common/Minimal/IntQueue.c
    ../Common/Minimal/QueueOverwrite.c
    ../Common/Minimal/QueueSet.c
    ../Common/Minimal/countsem.c
    ../Common/Minimal/dynamic.c
    ../Common/Minimal/recmutex.c
    ../Common/Minimal/EventGroupsDemo.c)

set(TARGET_NAME "RTOSDemo")

set(TARGET_ELF_NAME "${TARGET_NAME}.elf")

add_executable(${TARGET_ELF_NAME} ${SOURCES})
target_include_directories(${TARGET_ELF_NAME} PUBLIC ../Common/include/ .)
target_link_libraries(${TARGET_ELF_NAME} freertos_kernel)

target_compile_options(
  ${TARGET_ELF_NAME}
  PUBLIC ${USER_FLAGS} ${MOPTIMIZATION} -fdata-sections -ffunction-sections
         -no-legacy-libc -mdfp=${DFP_PATH})
target_compile_definitions(
  ${TARGET_ELF_NAME} PUBLIC XPRJ_default=default ${DEFINES}
                            -DconfigUSE_TASK_FPU_SUPPORT=0)
target_link_options(${TARGET_ELF_NAME} PUBLIC ${MOPTIMIZATION})
target_link_libraries(${TARGET_ELF_NAME} "-Wl,${XC32_LINK_FLAGS}")

if(CONFIG_DEMO_PIC32MZ)
  # HEX file build command
  add_custom_command(
    OUTPUT ${TARGET_NAME}.hex
    DEPENDS ${TARGET_ELF_NAME}
    COMMAND ${XC32_TOOLCHAIN_PATH}/xc32-bin2hex ${TARGET_ELF_NAME})
  add_custom_target(Reader_hex ALL DEPENDS ${TARGET_NAME}.hex)
endif()
