cmake_minimum_required(VERSION 3.14)

project(test_cmake_initTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(test_cmake_init REQUIRED)
  enable_testing()
endif()

find_package(Catch2 REQUIRED)
include(Catch)

# ---- Tests ----

add_executable(test_cmake_init_test source/test_cmake_init_test.cpp)
target_link_libraries(
    test_cmake_init_test PRIVATE
    test_cmake_init::test_cmake_init
    Catch2::Catch2WithMain
)
target_compile_features(test_cmake_init_test PRIVATE cxx_std_20)

catch_discover_tests(test_cmake_init_test)

# ---- End-of-file commands ----

add_folders(Test)
