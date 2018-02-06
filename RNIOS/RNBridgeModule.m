//
//  RNBridgeModule.m
//  RNIOS
//
//  Created by syc on 2018/2/6.
//  Copyright © 2018年 syc. All rights reserved.
//

#import "RNBridgeModule.h"
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@implementation RNBridgeModule
@synthesize bridge = _bridge;

/*
 实现RCT_EXPORT_MODULE()宏定义，
 括号参数不填为默认桥接类的名称，也可以自定义填写。
 该名称用来指定在JavaScript中访问这个模块的名称。
 */
RCT_EXPORT_MODULE(RNBridgeModule)

/*
 功能一：
 RN传参数调用原生OC,并且返回数据给RN
 */



/**
 实现方式一 通过CallBack 回调

 @param NSDictionary RN传过来的数据
 @return 给RN的回调
 callback 方法中传入一个参数数组，其实该数组的第一个参数为一个NSError对象，如果没有错误返回null，其余的数据作为该方法的返回值回调给JavaScritp。
 RNInvokeOCCallBack 方法有两个参数:第一个参数代表从JavaScript传过来的数据,第二个参数是回调方法，通过该回调方法把原生信息发送到JavaScript中
 */
RCT_EXPORT_METHOD(RNInvokeOCCallBack:(NSDictionary *)dictionary
                  callback:(RCTResponseSenderBlock)callback){
    NSLog(@"RN传过来的数据--> %@",dictionary);
    NSArray *array = [[NSArray alloc]initWithObjects:@"上海", @"厦门",@"callback回调",nil];
    callback(@[[NSNull null],array]);
}


/**
 实现方式二 通过Promise 回调

 @param NSDictionary RN传过来的数据
 RNInvokeOCPromise方法，该会有三个参数:
    dictionary:JavaScript传入的数据
    resolve:成功,回调数据
    reject:失败,回调数据
 
 resove方法传入具体的成功信息
 reject方法必须传入三个参数：
    错误代码code
    错误信息message
    NSError对象
 */
RCT_EXPORT_METHOD(RNInvokeOCPromise:(NSDictionary *)dictionary
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    NSLog(@"RN传过来的数据--> %@",dictionary);
    NSString *value=[dictionary objectForKey:@"name"];
    if([value isEqualToString:@"syc"]){
        resolve(@"回调成功啦,Promise...");
    }else{
        NSError *error=[NSError errorWithDomain:@"传入的name不符合要求,回调失败啦,Promise..." code:100 userInfo:nil];
        reject(@"100",@"传入的name不符合要求,回调失败啦,Promise...",error);
    }
}


/*
 功能二：
 iOS原生访问调用React Native
 */


/*
 功能二实现：
 
 dictionary RN触发动作传过来的数据
 sendAppEventWithName方法作用 OC访问调用RN
 包含二个参数:
    第一个参数:EventReminder自定义一个事件名称
    第二个参数:具体传入JavaScrtipt的数据信息
 */
RCT_EXPORT_METHOD(VCOpenRN:(NSDictionary *)dictionary) {
    NSDictionary *body = @{};
    NSString *value = [dictionary objectForKey:@"name"];
    if ([value isEqualToString:@"syc"]) {
        body = @{@"name":[NSString stringWithFormat:@"%@",value],
                               @"errorCode":@"0",
                               @"msg":@"成功"};
    }else {
      body = @{@"name":[NSString stringWithFormat:@"%@",value],
                               @"errorCode":@"0",
                               @"msg":@"输入的name不是syc"};
    }
    [self.bridge.eventDispatcher sendAppEventWithName:@"EventReminder" body:body];
}


@end
