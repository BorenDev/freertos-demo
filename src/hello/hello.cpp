#include <stdint.h>
#include <stdio.h>

#include "FreeRTOS.h"
#include "task.h"

void test() {
  printf("tskKERNEL_VERSION_NUMBER: %s\n", tskKERNEL_VERSION_NUMBER);
}

int32_t main() {
  printf("Hello Willis\n");
  test();
  return 0;
}
