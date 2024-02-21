set(SOURCES
    ConfigPerformance.c
    ParTest/ParTest.c
    main.c
    )

set(TARGET_NAME "${FIP_NAME}-${APP_NAME}")

set(TARGET_ELF_NAME "${TARGET_NAME}.elf")

add_executable(${TARGET_ELF_NAME} ${SOURCES})
target_include_directories(${TARGET_ELF_NAME} PUBLIC ParTest/ .)
target_link_libraries(${TARGET_ELF_NAME} freertos_kernel ${APP_NAME})

target_compile_options(
  ${TARGET_ELF_NAME}
  PUBLIC ${USER_FLAGS} ${MOPTIMIZATION} -fdata-sections -ffunction-sections
         -mdfp=${DFP_PATH})
target_compile_definitions(
  ${TARGET_ELF_NAME} PUBLIC XPRJ_default=default ${DEFINES}
                            -DconfigUSE_TASK_FPU_SUPPORT=0)
target_link_options(${TARGET_ELF_NAME} PUBLIC ${MOPTIMIZATION})
target_link_libraries(${TARGET_ELF_NAME} "-Wl,${XC32_LINK_FLAGS}")

# HEX file build command
add_custom_command(
  OUTPUT ${TARGET_NAME}.hex
  DEPENDS ${TARGET_ELF_NAME}
  COMMAND ${XC32_TOOLCHAIN_PATH}/xc32-bin2hex ${TARGET_ELF_NAME})
add_custom_target(${TARGET_NAME}_hex ALL DEPENDS ${TARGET_NAME}.hex)
