#include <iostream>

#include "dummy/dummy.h"

// Define a default value in case the macro is not set
#ifndef GIT_COMMIT_HASH
#define GIT_COMMIT_HASH "unknown"
#endif

int main() {
  std::cout << "Current Git commit hash: " << GIT_COMMIT_HASH << std::endl;
  return 0;
}
