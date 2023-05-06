if(PROJECT_IS_TOP_LEVEL)
  set(
      CMAKE_INSTALL_INCLUDEDIR "include/test_cmake_init-${PROJECT_VERSION}"
      CACHE PATH ""
  )
endif()

# Project is configured with no languages, so tell GNUInstallDirs the lib dir
set(CMAKE_INSTALL_LIBDIR lib CACHE PATH "")

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package test_cmake_init)

install(
    DIRECTORY include/
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT test_cmake_init_Development
)

install(
    TARGETS test_cmake_init_test_cmake_init
    EXPORT test_cmake_initTargets
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
    ARCH_INDEPENDENT
)

# Allow package maintainers to freely override the path for the configs
set(
    test_cmake_init_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}"
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
