#include "test_cmake_init/test_cmake_init.hpp"

auto main() -> int
{
  auto const result = name();

  return result == "test_cmake_init" ? 0 : 1;
}
