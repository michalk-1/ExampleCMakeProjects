#ifndef FOO__FOO_HPP
#define FOO__FOO_HPP
#include <string>
#include <variant>

std::variant<int, std::string> add(int x, int y);

#endif // FOO__FOO_HPP
