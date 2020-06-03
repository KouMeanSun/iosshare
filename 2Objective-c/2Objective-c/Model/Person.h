//
//  Person.h
//  2Objective-c
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Person : NSObject
//{
//    @public char*  _name;
//    NSUInteger _age;
//
//    @private char _gender;
//}
//
//-(void)setName:(char *)name;
//-(char *)getName;

//属性
// nonatomic 非原子性,
//copy,assign,strong,weak 引用类型
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign)NSUInteger age;
@property (nonatomic,copy) NSString *gender;

//自定义构造方法
-(instancetype)initWithName:(NSString *)name gender:(NSString *)gender;
@end


