find_package(eggs.variant REQUIRED)

add_library(Foo foo.cpp)

get_target_property(eggs_variant_INCLUDE_DIR Eggs::Variant INTERFACE_INCLUDE_DIRECTORIES)

target_include_directories(Foo
  PUBLIC
    ${eggs_variant_INCLUDE_DIR}
)

target_link_libraries(Foo
  PUBLIC
    Eggs::Variant
)

set_target_properties(Foo
  PROPERTIES
    INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/source/libraries"
    COMPILE_FEATURES "${CMAKE_CXX14_COMPILE_FEATURES}"
)
