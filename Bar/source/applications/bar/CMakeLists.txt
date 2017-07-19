find_package(Foo REQUIRED)
add_executable(Bar bar.cpp)
target_link_libraries(Bar PRIVATE Foo)

set_target_properties(Bar
  PROPERTIES
    COMPILE_FEATURES "${CMAKE_CXX14_COMPILE_FEATURES}"
)
