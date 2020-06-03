//
//  SecondViewController.h
//  3HttpAndBlockDelegate
//
//  Created by Gaomingyang on 2020/6/3.
//  Copyright © 2020 mg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SecondViewControllerBlock)(NSString *picUri);

@interface SecondViewController : UIViewController

@property (nonatomic,copy)NSString *url;

@property (nonatomic,copy)SecondViewControllerBlock block;

@end

