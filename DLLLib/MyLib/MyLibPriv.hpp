//
//  MyLibPriv.hpp
//  MyLib
//
//  Created by Gaomingyang on 2020/6/3.
//

/* The classes below are not exported */
#pragma GCC visibility push(hidden)

class MyLibPriv
{
    public:
    void HelloWorldPriv(const char *);
    public:
    int Sum(int a,int b);
};

#pragma GCC visibility pop
