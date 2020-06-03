//
//  ViewController.m
//  4UIkit
//
//  Created by Gaomingyang on 2020/6/3.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

-(void)commonInit{
    self.title = @"UI";
    self.view.backgroundColor = [UIColor greenColor];
    [self initUI];
}
-(void)initUI{
    //UILabel
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    lbl.text = @"文本";
    [self.view addSubview:lbl];
    
    //UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    
    btn.frame = CGRectMake(100, 150, 100, 40);
    [self.view addSubview:btn];
    //添加点击事件
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //UIImage
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 200, 350, 350)];
    imgV.image = [UIImage imageNamed:@"faceman.jpg"];
    [self.view addSubview:imgV];
    
    UIImageView *imgV2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 560, 250, 250)];
    imgV2.image = [UIImage imageNamed:@"screenshot"];
    imgV2.contentMode = UIViewContentModeScaleAspectFit;//伸缩模式
//    [UIImage imageWithData:<#(nonnull NSData *)#>];//RGB 格式
    [self.view addSubview:imgV2];
    
}

#pragma mark -- btn 点击事件
-(void)onClick:(UIButton *)btn{
    NSLog(@"点击了确定按钮");
}
@end
