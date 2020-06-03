//
//  HttpManager.h
//  2Objective-c
//
//  Created by Gaomingyang on 2020/6/2.
//  Copyright © 2020 mg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpManagerDelegate <NSObject>
//成功d的回调函数
-(void)finishHttpConnectionWithDataList:(NSMutableArray *)list;
//失败的回调函数
-(void)failedHttpConnectionWithError:(NSError *)error;

@end

@interface HttpManager : NSObject

+(HttpManager *)sharedInstance;

-(void)getHttpDataWithUrlStr:(NSString *)urlStr   andBlock:(void(^)(NSMutableArray *list,NSError *error))block;

-(void)getHttpDataWithURLStr:(NSString *)urlStr  andDelegate:(id<HttpManagerDelegate>)delegate;
@end

