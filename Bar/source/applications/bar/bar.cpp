#include "foo/foo.hpp"
#include <limits>
#include <iostream>

int main(int argc, char*[])
{
    int& x = argc;
    std::cout << "x=" << x << '\n';
    int y = std::numeric_limits<int>::max() - 1;
    std::cout << "y=" << y << '\n';
    std::cout << "result: " << x + y << '\n';
    auto result = add(x, y);

    if (std::holds_alternative<std::string>(result))
        std::cout << "result: " << std::get<std::string>(result);
    else
        std::cout << "result: " << std::get<int>(result);

    std::cout << '\n';
    return 0;
}
