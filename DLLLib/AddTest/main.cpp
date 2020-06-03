//
//  main.cpp
//  AddTest
//
//  Created by Gaomingyang on 2020/6/3.
//

#include <iostream>
#include "../MyLib/MyLib.hpp"
int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
 
    MyLib myLib;
//    myLib.HelloWorld("hello MyLib");
    int r = myLib.Sum(3, 5);
    std::cout << r<<"\n";
    return 0;
}
