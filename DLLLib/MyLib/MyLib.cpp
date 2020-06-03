//
//  MyLib.cpp
//  MyLib
//
//  Created by Gaomingyang on 2020/6/3.
//

#include <iostream>
#include "MyLib.hpp"
#include "MyLibPriv.hpp"

void MyLib::HelloWorld(const char * s)
{
    MyLibPriv *theObj = new MyLibPriv;
    theObj->HelloWorldPriv(s);
    delete theObj;
};

int MyLib::Sum(int a, int b)
{
    MyLibPriv *theObj = new MyLibPriv;
    int r = theObj->Sum(a, b);
    delete theObj;
    return r;
}

void MyLibPriv::HelloWorldPriv(const char * s) 
{
    std::cout << s << std::endl;
};

int MyLibPriv::Sum(int a,int b)
{
    return (a+b);
}
