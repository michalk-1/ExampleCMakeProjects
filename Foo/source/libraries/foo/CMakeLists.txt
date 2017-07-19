find_package(eggs.variant REQUIRED)
add_library(Foo foo.cpp)
target_include_directories(Foo PUBLIC ${PROJECT_SOURCE_DIR}/source/libraries)
target_link_libraries(Foo PUBLIC Eggs::Variant)

set_target_properties(Foo
  PROPERTIES
    COMPILE_FEATURES "${CMAKE_CXX14_COMPILE_FEATURES}"
)
