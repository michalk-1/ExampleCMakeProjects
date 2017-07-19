#ifndef FOO__FOO_HPP
#define FOO__FOO_HPP
#include <string>
#include "eggs/variant.hpp"
namespace foo {

eggs::variant<int, std::string> add(int x, int y);

} // namespace foo
#endif // FOO__FOO_HPP
