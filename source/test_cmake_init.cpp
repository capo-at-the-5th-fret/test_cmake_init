#include <string>

#include "test_cmake_init/test_cmake_init.hpp"

#include <fmt/core.h>

exported_class::exported_class()
    : m_name {fmt::format("{}", "test_cmake_init")}
{
}

auto exported_class::name() const -> const char*
{
  return m_name.c_str();
}
