//
//  SycScrollviewManager.m
//  demo
//
//  Created by syc on 2018/2/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "SycScrollviewManager.h" //view的管理类
#import "SycScrollView.h"    //需要集成的原生组件头文件
#import <React/RCTBridge.h>  //进行通信的头文件
#import <React/RCTEventDispatcher.h> //事件派发，不导入会引起Xcode警告

@interface SycScrollviewManager() <SDCycleScrollViewDelegate>

@end

@implementation SycScrollviewManager

RCT_EXPORT_MODULE()



- (SycScrollView *)view
{
    SycScrollView *testScrollView = [SycScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
    testScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    testScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    return testScrollView;
   
}

#pragma mark SDCycleScrollViewDelegate

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    SycScrollView *sycScrllView = (SycScrollView *)cycleScrollView;
    if (!sycScrllView.onClickBanner) {
        return;
    }
    sycScrllView.onClickBanner(@{@"target":sycScrllView.reactTag,
                                 @"value" :[NSNumber numberWithInteger:index+1],
                                 });
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    SycScrollView *sycScrllView = (SycScrollView *)cycleScrollView;
    if (!sycScrllView.onClickBanner) {
        return;
    }
    sycScrllView.onDidScrollerBanner(@{@"target":sycScrllView.reactTag,
                                       @"value" :[NSNumber numberWithInteger:index+1],
                                 });
}

//导出枚举常量，给js 定义样式用
- (NSDictionary *)constantsToExport {
    return @{
             @"SDCycleScrollViewPageContolAliment": @{
                     @"right": @(SDCycleScrollViewPageContolAlimentRight),
                     @"center": @(SDCycleScrollViewPageContolAlimentCenter)
                     }
             };
}



RCT_EXPORT_VIEW_PROPERTY(autoScrollTimeInterval, CGFloat); //导出相应属性

RCT_EXPORT_VIEW_PROPERTY(imageURLStringsGroup, NSArray);   //导出相应属性

RCT_EXPORT_VIEW_PROPERTY(autoScroll, BOOL);                //导出相应属性

RCT_EXPORT_VIEW_PROPERTY(pageControlAliment, NSInteger);   //导出相应属性

RCT_EXPORT_VIEW_PROPERTY(onClickBanner, RCTBubblingEventBlock); //导出事件
RCT_EXPORT_VIEW_PROPERTY(onDidScrollerBanner, RCTBubblingEventBlock);


RCT_EXPORT_VIEW_PROPERTY(onClickView, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(dict,NSDictionary);
@end
