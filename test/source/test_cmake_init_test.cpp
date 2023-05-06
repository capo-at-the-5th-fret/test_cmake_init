#include "test_cmake_init/test_cmake_init.hpp"

void foo(int x)
{
  int buf[10];
  buf[x] = 0;  // <- ERROR
  if (x == 1000) {
  }
}

auto main() -> int
{
  auto const result = name();
  foo(0);
  return result == "test_cmake_init" ? 0 : 1;
}
