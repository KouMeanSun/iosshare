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
@end
