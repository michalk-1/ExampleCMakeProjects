find_package(eggs.variant REQUIRED)

add_library(Foo foo.cpp)

set_target_properties(Foo
  PROPERTIES
    INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/source/libraries"
    COMPILE_FEATURES "${CMAKE_CXX14_COMPILE_FEATURES}"
)
