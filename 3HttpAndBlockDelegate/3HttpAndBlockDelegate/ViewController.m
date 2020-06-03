//
//  ViewController.m
//  3HttpAndBlockDelegate
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "ViewController.h"
#import "HttpManager.h"
#import "Movie.h"
#import "SecondViewController.h"

static  NSString *myCellID = @"myCellID";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HttpManagerDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

-(void)commonInit{
    self.title = @"HTTP";
    [self initViews];
    [self loadHttpData];
}
-(void)initViews{
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 74, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-74);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 300, 150, 40);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)onClick:(UIButton *)btn{
    NSLog(@"点击了按钮");
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.url = @"www.baidu.com";
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)loadHttpData{
    // 测试UIL https://reactnative.dev/movies.json
    HttpManager *httpManager = [HttpManager sharedInstance];
//    __weak typeof(self) weakSelf = self;//弱引用 self，
//    [httpManager getHttpDataWithUrlStr:@"https://reactnative.dev/movies.json" andBlock:^(NSMutableArray *list, NSError *error) {
//        __strong typeof(weakSelf) strongSelf = weakSelf;//请引用 外面弱引用的weakSelf
//        //** __weak typeof(self) weakSelf = self;__strong typeof(weakSelf) strongSelf = weakSelf;
//        //联合使用就是为了防止 循环引用 self，造成内存泄漏
//        if (error) {
//            NSLog(@"error:%@",error);
//            //通知UI，请求错误
//        }else{
//            NSLog(@"list:%@",list);
//            //如果没有错误，则刷新UI 重点！
//            [strongSelf.dataList removeAllObjects];
//            [strongSelf.dataList addObjectsFromArray:list];
//            //因为当前代码在子线程，但是刷新UI要回到主线程
//            dispatch_async(dispatch_get_main_queue(),^{
//                //刷新 列表
//                [self.tableView reloadData];
//            });
//        }
//    }];
    
    [httpManager getHttpDataWithURLStr:@"https://reactnative.dev/movies.json" andDelegate:self];
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellID];
    Movie *movie = [self.dataList objectAtIndex:indexPath.row];
    cell.textLabel.text = movie.title;
    cell.detailTextLabel.text = movie.releaseYear;
    return  cell;
}
#pragma mark -- HttpManagerDelegate
-(void)finishHttpConnectionWithDataList:(NSMutableArray *)list{
    [self.dataList removeAllObjects];
    [self.dataList addObjectsFromArray:list];
    //刷新 列表
    dispatch_async(dispatch_get_main_queue(),^{
                    //刷新 列表
          [self.tableView reloadData];
   });
}
-(void)failedHttpConnectionWithError:(NSError *)error{
    NSLog(@"error:%@",error);
}
#pragma mark -- lazy load
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
         _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         _tableView.showsVerticalScrollIndicator = NO;
         _tableView.backgroundColor = [UIColor whiteColor];
         _tableView.delegate = self;
         _tableView.dataSource = self;
         _tableView.estimatedSectionHeaderHeight = 0;
         _tableView.estimatedSectionFooterHeight = 0;
         _tableView.rowHeight = UITableViewAutomaticDimension;
         if (@available(iOS 11.0, *)) {
             _tableView.estimatedRowHeight = 0;
             _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
         }
         [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:myCellID];
    
    }
    return _tableView;
}
-(NSMutableArray *)dataList{
    if(!_dataList){
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}
@end
