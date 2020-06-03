//
//  SecondViewController.m
//  3HttpAndBlockDelegate
//
//  Created by Gaomingyang on 2020/6/3.
//  Copyright © 2020 mg. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(self.url){
        NSLog(@"url:%@",self.url);
    }
    [self commonInit];
}
-(void)commonInit{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 300, 150, 40);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)onClick:(UIButton *)btn{
    NSLog(@"点击了返回按钮");
    if(self.block){
        self.block(@"图片路径/usr/xxx");
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
