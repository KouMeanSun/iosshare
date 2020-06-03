//
//  ViewController.m
//  2Objective-c
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
    
}

-(void)commonInit{
    NSLog(@"commonInit");
    self.title = @"主页";
    self.view.backgroundColor = [UIColor systemPinkColor];
    
//    Person *person = [[Person alloc] init];
//    person->_name = "李白";
//    person->_age = 100;
//
//    NSLog(@" name : %s ,age : % ld ",person->_name,person->_age);
    
//    [person setName:"杜甫"];
//    NSLog(@"name : %s ",[person getName]);
    
//    person.name = @"崔浩";
//    person.age = 1000;
//
//    NSLog(@" name :%@ ,age : %ld ",person.name,person.age);
    
//    Person *person2 = [[Person alloc] initWithName:@"王维" gender:@"男"];
//    NSLog(@" name :%@ ,gender : %@ ",person2.name,person2.gender);
    
    [self testArray];
    [self testDictionary];
}

-(void)testArray{
    //不可变数组，不能够改变数组长度
    NSArray *array = @[@1,@2,@3,@4,@5];
    NSLog(@"array : %@",array);
    
    //可变数组,可以改变长度和，
    NSMutableArray *list = [NSMutableArray arrayWithArray:array];
    [list addObject:@6];
    NSLog(@"list : %@",list);
    [list removeAllObjects];
    NSLog(@"list : %@",list);

    
}
-(void)testDictionary{
    // 不可变字典NSDictionary，创建好之后，里面的内容不可以更改
            // 创建的方法
            // 字典也是一个集合
           
            // 字典和组数的区别
            // 数组有下标，字典没有
            // 数组是有序，字典无序
            // 字典是一个键值对 key = value
            NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"one", @"2",@"two", @"3",@"three", @"20",@"age", nil];

     // 以value数组和key数组的方式创建
            NSDictionary *dic2 = [[NSDictionary alloc] initWithObjects:@[@"1",@"2",@"3"] forKeys:@[@"one",@"two",@"three"]];

    // NSMutableDictionary 创建方式
            // 可变字典的内容创建好后是可以改变的
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    //        [NSMutableDictionary dictionary]
           
            // 创建的同时赋值
            NSMutableDictionary *dic11 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"1", @"one", nil];
    //        [NSMutableDictionary dictionaryWithObjectsAndKeys:<#(id), ...#>, nil]
           
            // 利用的数组的方式创建
            NSMutableDictionary *dic22 = [[NSMutableDictionary alloc] initWithObjects:@[@"1",@"2"] forKeys:@[@"one",@"two"]];
    //        [NSMutableDictionary dictionaryWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>]
           
            // 通过旧的字典创建一个新的字典
    //        NSMutableDictionary *dic3 = [NSMutableDictionary alloc] initWithDictionary:<#(NSDictionary *)#>;
           
            // @{} 创建不可变字典
            // @[] 创建不可变数组
           
           
            // 如果key不存在，就是新增
            [dic setValue:@"1" forKey:@"one"];
            NSLog(@"dic = %@", dic);
           
            // 如果key已经存在那么就是修改
            [dic setValue:@"111" forKey:@"one"];
            NSLog(@"dic = %@", dic);
           
            [dic setValue:@"2" forKey:@"two"];
            [dic setValue:@"3" forKey:@"tree"];
           
            // 通过key删除一对键值对
            [dic removeObjectForKey:@"two"];
            NSLog(@"dic = %@", dic);
           
            // 通过数组的方式一次删除多个key
    //        [dic removeObjectsForKeys:@[@"one", @"tree"]];
            NSLog(@"dic = %@", dic);
           
            // 删除所有的key
            [dic removeAllObjects];
            NSLog(@"dic = %@", dic);
}
@end
