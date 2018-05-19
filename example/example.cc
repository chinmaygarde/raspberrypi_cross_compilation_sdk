
#include <iostream>

extern "C" {
#include "another_example.h"
}

int main(int argc, char const *argv[]) {
  std::cout << "Hello World." << std::endl;
  PrintExampleString();
  return 0;
}
