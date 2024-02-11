cmake_minimum_required(VERSION 3.22)

project(
  freertos_demo
  VERSION 0.1.0
  LANGUAGES C CXX)

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
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/blink")
elseif(CONFIG_WIN32_MINGW)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/examples/WIN32-MingW")
endif()

add_library(freertos_config INTERFACE)
target_include_directories(freertos_config SYSTEM
                           INTERFACE ${FREE_RTOS_CFG_DIR})

target_compile_definitions(freertos_config INTERFACE projCOVERAGE_TEST=1)

include(dependencies.cmake)

add_subdirectory(src)
