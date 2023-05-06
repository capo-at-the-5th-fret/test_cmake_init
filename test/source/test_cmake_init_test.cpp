#include <string>

#include "test_cmake_init/test_cmake_init.hpp"

#include <catch2/catch_test_macros.hpp>

TEST_CASE("Name is test_cmake_init", "[library]")
{
  auto const exported = exported_class {};
  REQUIRE(std::string("test_cmake_init") == exported.name());
}
