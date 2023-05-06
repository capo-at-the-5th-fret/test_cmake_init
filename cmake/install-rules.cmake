if(PROJECT_IS_TOP_LEVEL)
  set(
      CMAKE_INSTALL_INCLUDEDIR "include/test_cmake_init-${PROJECT_VERSION}"
      CACHE PATH ""
  )
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package test_cmake_init)

install(
    DIRECTORY
    include/
    "${PROJECT_BINARY_DIR}/export/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT test_cmake_init_Development
)

install(
    TARGETS test_cmake_init_test_cmake_init
    EXPORT test_cmake_initTargets
    RUNTIME #
    COMPONENT test_cmake_init_Runtime
    LIBRARY #
    COMPONENT test_cmake_init_Runtime
    NAMELINK_COMPONENT test_cmake_init_Development
    ARCHIVE #
    COMPONENT test_cmake_init_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    test_cmake_init_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(test_cmake_init_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${test_cmake_init_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT test_cmake_init_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${test_cmake_init_INSTALL_CMAKEDIR}"
    COMPONENT test_cmake_init_Development
)

install(
    EXPORT test_cmake_initTargets
    NAMESPACE test_cmake_init::
    DESTINATION "${test_cmake_init_INSTALL_CMAKEDIR}"
    COMPONENT test_cmake_init_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
