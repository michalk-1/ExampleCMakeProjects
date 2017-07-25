# Provides the following variables:
#
#   Foo_INCLUDE_DIRS - include directories
#   Foo_LIBRARIES    - libraries to link against
#
# It defines also the following IMPORTED target:
#
#   Foo

include(CMakeFindDependencyMacro)
include(FindPackageHandleStandardArgs)

# ============================== FooConfig.cmake ==============================

list(
  APPEND CMAKE_PREFIX_PATH
  ${CMAKE_CURRENT_LIST_DIR}/../dependencies/variant/result
)

find_dependency(eggs.variant REQUIRED)

get_filename_component(Foo_DIR "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)

include("${Foo_DIR}/FooTargets.cmake")

get_target_property(
  Foo_INCLUDE_DIRS Foo
  INTERFACE_INCLUDE_DIRECTORIES
)

foreach(Foo_INCLUDE_DIR ${Foo_INCLUDE_DIRS})
  if (NOT EXISTS "${Foo_INCLUDE_DIR}")
    message(FATAL_ERROR
      "Directory ${Foo_INCLUDE_DIR} referenced by "
      "variable \${Foo_INCLUDE_DIRS} does not exist!"
    )
  endif()
endforeach()

set(Foo_LIBRARIES Foo)

mark_as_advanced(Foo_INCLUDE_DIRS Foo_LIBRARIES)

find_package_handle_standard_args(Foo
  REQUIRED_VARS
    Foo_LIBRARIES
    Foo_INCLUDE_DIRS
)
