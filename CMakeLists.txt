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

if(CONFIG_POSIX_GCC)
  set(FIP_NAME "fip-posix-gcc")
  set(FIP_TGT_DIR "fips/${FIP_NAME}")
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${FIP_TGT_DIR}")
elseif(CONFIG_PIC32MZ2048EFM144)
  set(FIP_NAME "fip-pic32mz2048efm144")
  set(FIP_TGT_DIR "fips/${FIP_NAME}")
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${FIP_TGT_DIR}")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/pic32mz_toolchain.cmake")
elseif(CONFIG_WIN32_MINGw)
  set(FIP_NAME "fip-win32-mingw")
  set(FIP_TGT_DIR "fips/${FIP_NAME}")
  set(FREE_RTOS_CFG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/${FIP_TGT_DIR}")
  include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/win32_mingw_toolchain.cmake")
endif()

add_library(freertos_config INTERFACE)
target_compile_definitions(freertos_config INTERFACE "projCOVERAGE_TEST=1")
target_include_directories(freertos_config INTERFACE "${FREE_RTOS_CFG_DIR}")

include(dependencies.cmake)

add_subdirectory(${FIP_TGT_DIR})
add_subdirectory(src)
