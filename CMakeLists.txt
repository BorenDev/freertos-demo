cmake_minimum_required(VERSION 3.22)

project(
  freertos_demo
  VERSION 0.1.0
  LANGUAGES C ASM)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(PROJECT_IS_TOP_LEVEL ON)
else()
  set(PROJECT_IS_TOP_LEVEL OFF)
endif()

if(NOT PROJECT_IS_TOP_LEVEL)
  set_directory_properties(PROPERTIES EXCLUDE_FROM_ALL ON)
endif()

if(CONFIG_DEMO_POSIX)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/demos/posix")
elseif(CONFIG_DEMO_PIC32MZ)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/demos/pic32mz")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/pic32mz_toolchain.cmake")
elseif(CONFIG_DEMO_MINGW)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/demos/win32")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/win32_mingw_toolchain.cmake")
elseif(CONFIG_EXAMPLE_POSIX)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/examples/posix")
elseif(CONFIG_EXAMPLE_PIC32MZ)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/examples/pic32mz")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/pic32mz_toolchain.cmake")
elseif(CONFIG_EXAMPLE_MINGW)
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/examples/win32")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/win32_mingw_toolchain.cmake")
endif()

add_library(freertos_config INTERFACE)
target_include_directories(freertos_config INTERFACE "${FREE_RTOS_CFG_DIR}")
target_compile_definitions(freertos_config INTERFACE "projCOVERAGE_TEST=1")

include(dependencies.cmake)

add_subdirectory(src)
