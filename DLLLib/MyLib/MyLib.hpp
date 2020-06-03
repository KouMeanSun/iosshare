//
//  MyLib.hpp
//  MyLib
//
//  Created by Gaomingyang on 2020/6/3.
//

#ifndef MyLib_
#define MyLib_

/* The classes below are exported */
#pragma GCC visibility push(default)

class MyLib
{
    public:
    void HelloWorld(const char *);
    public:
    int Sum(int a,int b);
};

#pragma GCC visibility pop
#endif
