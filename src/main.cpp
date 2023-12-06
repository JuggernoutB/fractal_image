#include <iostream>

void func(const char * msg)
{
  std::cout << msg  << std::endl;
}

int main()
{
  func("Hellow world");
  return 0;
}
