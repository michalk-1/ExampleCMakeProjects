
include(CMakeFindDependencyMacro)
include(FindPackageHandleStandardArgs)

# ============================== FooConfig.cmake ==============================

find_path(
  Foo_INCLUDE_DIR
  foo/foo.hpp
  HINTS ${CMAKE_CURRENT_LIST_DIR}/source/libraries
)

find_library(
  Foo_LIBRARY
  Foo
  HINTS ${CMAKE_CURRENT_LIST_DIR}/build/libraries
)

mark_as_advanced(Foo_INCLUDE_DIR Foo_LIBRARY)

find_package_handle_standard_args(Foo
  REQUIRED_VARS
    Foo_LIBRARY
    Foo_INCLUDE_DIR
)

list(
  APPEND CMAKE_PREFIX_PATH
  ${CMAKE_CURRENT_LIST_DIR}/dependencies/variant/build/usr/local
)

find_dependency(eggs.variant REQUIRED)

get_target_property(
  eggs_variant_INCLUDE_DIR
  Eggs::Variant
  INTERFACE_INCLUDE_DIRECTORIES
)

if(Foo_FOUND AND NOT TARGET Foo)
  add_library(Foo UNKNOWN IMPORTED)
  set_target_properties(Foo
    PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
      IMPORTED_LOCATION "${Foo_LIBRARY}"
      INTERFACE_INCLUDE_DIRECTORIES
        "${Foo_INCLUDE_DIR};${eggs_variant_INCLUDE_DIR}"
  )
endif()
