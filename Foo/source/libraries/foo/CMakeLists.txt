# define target

find_package(eggs.variant REQUIRED)

add_library(Foo foo.cpp)

target_include_directories(Foo
  PUBLIC
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source/libraries>
    $<INSTALL_INTERFACE:libraries>
)

target_link_libraries(Foo PUBLIC Eggs::Variant)

set_target_properties(Foo
  PROPERTIES
    COMPILE_FEATURES "${CMAKE_CXX14_COMPILE_FEATURES}"
)

# generate

# generate Config.cmake
configure_file(
  "${PROJECT_SOURCE_DIR}/templates/FooConfig.in.cmake"
  "${PROJECT_BINARY_DIR}/FooConfig.cmake"
  @ONLY
)

# generate ConfigVersion.cmake
set(Foo_VERSION 0.0.1)

include(CMakePackageConfigHelpers)

write_basic_package_version_file(
  "${PROJECT_BINARY_DIR}/FooConfigVersion.cmake"
  VERSION ${Foo_VERSION} COMPATIBILITY SameMajorVersion
)

# install

# install headers
set(headers foo.hpp)
foreach(header ${headers})
  install(FILES ${header} DESTINATION libraries/foo)
endforeach()

# install targets
install(
  TARGETS Foo
  EXPORT  FooTargets
  LIBRARY DESTINATION libraries/foo
  ARCHIVE DESTINATION libraries/foo
)

# install Targets.cmake
install(
  EXPORT FooTargets
  FILE   FooTargets.cmake
  DESTINATION libraries/cmake
)

# install Config.cmake and ConfigVersion.cmake
install(
  FILES
    "${PROJECT_BINARY_DIR}/FooConfig.cmake"
    "${PROJECT_BINARY_DIR}/FooConfigVersion.cmake"
  DESTINATION libraries/cmake
)
