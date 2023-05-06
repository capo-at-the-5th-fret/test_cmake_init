cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    test_cmake_init
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES NONE
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(test_cmake_init_test_cmake_init INTERFACE)
add_library(test_cmake_init::test_cmake_init ALIAS test_cmake_init_test_cmake_init)

set_property(
    TARGET test_cmake_init_test_cmake_init PROPERTY
    EXPORT_NAME test_cmake_init
)

target_include_directories(
    test_cmake_init_test_cmake_init ${warning_guard}
    INTERFACE
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_compile_features(test_cmake_init_test_cmake_init INTERFACE cxx_std_23)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT test_cmake_init_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of test_cmake_init"
  )
endif()

include(cmake/dev-mode.cmake)
