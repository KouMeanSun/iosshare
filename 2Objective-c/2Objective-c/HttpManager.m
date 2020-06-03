//
//  HttpManager.m
//  2Objective-c
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "HttpManager.h"
// static，静态变量，该变量指针只有当程序退出的时候才会被销毁
static HttpManager *singleton = nil;
@implementation HttpManager
+ (HttpManager *)sharedInstance
{
    // 线程锁
    // 线程锁是为了确保锁内的代码只能同时被一个线程调用
    @synchronized(self){
        // 判断singleton是否为nil
        if (singleton == nil) {
            // 使用静态变量指针指向该对象
            singleton = [[HttpManager alloc] init];
        }
    }
    return singleton;
}
// 该方法会在调用alloc被执行
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        // 保证该对象只被一次实例化
        if (singleton == nil) {
            singleton = [super allocWithZone:zone];
        }
    }
    return singleton;
}
@end

