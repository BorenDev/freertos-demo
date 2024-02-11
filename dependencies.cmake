include(FetchContent)

FetchContent_Declare(
  freertos_kernel
  GIT_REPOSITORY https://github.com/FreeRTOS/FreeRTOS-Kernel.git
  GIT_TAG V11.0.1 # Note: Best practice to use specific git-hash or tagged
                  # version
)

FetchContent_MakeAvailable(freertos_kernel)
