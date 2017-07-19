set(target Foo)

add_library(${target}
    foo.cpp
)

set_target_properties(${target}
  PROPERTIES
    INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/source/libraries"
    COMPILE_FEATURES "${CMAKE_CXX17_COMPILE_FEATURES}"
)
