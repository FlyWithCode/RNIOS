//
//  RNTMLViewManager.m
//  RNIOS
//
//  Created by syc on 2018/2/6.
//  Copyright © 2018年 syc. All rights reserved.
//

#import "RNTMLViewManager.h"
#import "RNTMLView.h"
#import <React/RCTBridge.h>  //进行通信的头文件
#import <React/RCTEventDispatcher.h> //事件派发，不导入会引起Xcode警告

@implementation RNTMLViewManager
RCT_EXPORT_MODULE()

- (RNTMLView *)view {
    RNTMLView *view = [[RNTMLView alloc]init];
    return view;
}

//导出的属性和方法
RCT_EXPORT_VIEW_PROPERTY(dict, NSDictionary)
RCT_EXPORT_VIEW_PROPERTY(onClickView, RCTBubblingEventBlock)
@end
