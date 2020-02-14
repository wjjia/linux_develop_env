#ifndef TEST_CC
#define TEST_CC
#include <iostream>
using namespace std;
namespace tt {

class Box
{public:
      float length;   // 盒子的长度
      float breadth;  // 盒子的宽度
      float height;   // 盒子的高度
};

}

int main(int argc, const char *argv[]) {
Box box;
box.length = 0.3f;
box.height = 1.0;
std::cout << "l:" << box.length << std::endl;
}
