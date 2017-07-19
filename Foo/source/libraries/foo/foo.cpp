#include "foo/foo.hpp"
#include <limits>

eggs::variant<int, std::string> add(int x, int y)
{
    int result = x + y;
    if ((x > 0 || y > 0) && result < 0)
        return "Could not add " + std::to_string(x) + " to " + std::to_string(y);
    else
        return result;
}
