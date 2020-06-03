//
//  HttpManager.m
//  2Objective-c
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import "HttpManager.h"
#import "Movie.h"
// static，静态变量，该变量指针只有当程序退出的时候才会被销毁
static HttpManager *singleton = nil;
@implementation HttpManager
+ (HttpManager *)sharedInstance
{
    // 线程锁
    // 线程锁是为了确保锁内的代码只能同时被一个线程调用
    @synchronized(self){
        // 判断singleton是否为nil
        if (singleton == nil) {
            // 使用静态变量指针指向该对象
            singleton = [[HttpManager alloc] init];
        }
    }
    return singleton;
}
// 该方法会在调用alloc被执行
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        // 保证该对象只被一次实例化
        if (singleton == nil) {
            singleton = [super allocWithZone:zone];
        }
    }
    return singleton;
}

//************减 方法**************/
-(void)getHttpDataWithUrlStr:(NSString *)urlStr andBlock:(void (^)(NSMutableArray *, NSError *))block{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           
           if (error) {
               block(nil,error);
           }else{
               NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               NSArray *applications = jsonData[@"movies"];
               NSMutableArray *arr  = [NSMutableArray new];
               for (NSDictionary *dict  in applications) {
                   Movie *movie = [[Movie alloc] init];
                   movie.ID = [dict objectForKey:@"id"];
                   movie.title = [dict objectForKey:@"title"];
                   movie.releaseYear = [dict objectForKey:@"releaseYear"];
                   
                   [arr addObject:movie];
               }
               
               block(arr,nil);
               
           }
           
       }];
       [task resume];
}

-(void)getHttpDataWithURLStr:(NSString *)urlStr andDelegate:(id<HttpManagerDelegate>)delegate{
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
           
           if (error) {
               if(delegate && [delegate respondsToSelector:@selector(failedHttpConnectionWithError:)]){
                   [delegate failedHttpConnectionWithError:error];
               }
           }else{
               NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               NSArray *applications = jsonData[@"movies"];
               NSMutableArray *arr  = [NSMutableArray new];
               for (NSDictionary *dict  in applications) {
                   Movie *movie = [[Movie alloc] init];
                   movie.ID = [dict objectForKey:@"id"];
                   movie.title = [dict objectForKey:@"title"];
                   movie.releaseYear = [dict objectForKey:@"releaseYear"];
                   
                   [arr addObject:movie];
               }
               if(delegate && [delegate respondsToSelector:@selector(finishHttpConnectionWithDataList:)]){
                   [delegate finishHttpConnectionWithDataList:arr];
               }               
           }
           
       }];
       [task resume];
}
@end

