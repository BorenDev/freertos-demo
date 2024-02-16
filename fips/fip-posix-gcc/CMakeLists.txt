set(SOURCES console.c main.c)

set(TARGET_NAME "${FIP_NAME}-${APP_NAME}")

add_executable(${TARGET_NAME} ${SOURCES})
target_link_libraries(${TARGET_NAME} freertos_kernel ${APP_NAME})
target_include_directories(${TARGET_NAME} PUBLIC .)
