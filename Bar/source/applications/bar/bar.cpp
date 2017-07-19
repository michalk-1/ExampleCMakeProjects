#include <iostream>
#include <limits>
#include "foo/foo.hpp"

int main(int argc, char*[])
{
    auto& x = argc;
    auto y = std::numeric_limits<int>::max() - 1;
    auto result_plus = x + y;
    auto result_add = foo::add(x, y);

    std::cout << "x = " << x << '\n';
    std::cout << "y = " << y << '\n';
    std::cout << "x + y = " << result_plus << '\n';
    std::cout << "foo::add(x, y) = ";

    try {
        std::cout << eggs::get<int>(result_add);
    } catch (eggs::bad_variant_access const&) {
        std::cout << eggs::get<std::string>(result_add);
    }

    std::cout << '\n';
    return 0;
}
