cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    test_cmake_init
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    test_cmake_init_test_cmake_init
    source/test_cmake_init.cpp
)
add_library(test_cmake_init::test_cmake_init ALIAS test_cmake_init_test_cmake_init)

include(GenerateExportHeader)
generate_export_header(
    test_cmake_init_test_cmake_init
    BASE_NAME test_cmake_init
    EXPORT_FILE_NAME export/test_cmake_init/test_cmake_init_export.hpp
    CUSTOM_CONTENT_FROM_VARIABLE pragma_suppress_c4251
)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(test_cmake_init_test_cmake_init PUBLIC TEST_CMAKE_INIT_STATIC_DEFINE)
endif()

set_target_properties(
    test_cmake_init_test_cmake_init PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    VISIBILITY_INLINES_HIDDEN YES
    VERSION "${PROJECT_VERSION}"
    SOVERSION "${PROJECT_VERSION_MAJOR}"
    EXPORT_NAME test_cmake_init
    OUTPUT_NAME test_cmake_init
)

target_include_directories(
    test_cmake_init_test_cmake_init ${warning_guard}
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_include_directories(
    test_cmake_init_test_cmake_init SYSTEM
    PUBLIC
    "$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/export>"
)

target_compile_features(test_cmake_init_test_cmake_init PUBLIC cxx_std_20)

find_package(fmt REQUIRED)
target_link_libraries(test_cmake_init_test_cmake_init PRIVATE fmt::fmt)

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
