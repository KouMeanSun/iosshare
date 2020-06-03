//
//  MainViewController.m
//  认识xcode
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //view 加载完毕 生命周期
    self.title = @"主页";
    
    for(int i=0;i<10;i++){
        NSLog(@" i = %d ",i);
    }
    NSString *msg = @"月落乌啼霜满天";
    int tag = 10086;
    NSLog(@" msg = %@ ",msg);
    NSLog(@" tag = %d ",tag);

}



@end
