//
//  Person.m
//  2Objective-c
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "Person.h"

@implementation Person

//-(void)setName:(char *)name{
//    _name = name;
//}
//-(char *)getName{
//    return _name;
//}

-(instancetype)initWithName:(NSString *)name gender:(NSString *)gender{
    if(self = [super init]){
        self.name = name;
        self.gender = gender;
    }
    return self;
}
@end
