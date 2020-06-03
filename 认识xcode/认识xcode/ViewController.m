//
//  ViewController.m
//  认识xcode
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click:(UIButton *)sender {
    NSLog(@"点击了按钮");
    self.titleLbl.text = @" 点击了 按钮";
}

@end
