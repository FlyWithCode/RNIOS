//
//  SycScrollView.h
//  demo
//
//  Created by syc on 2018/2/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "SDCycleScrollView.h"
#import "UIView+React.h"
#import <React/RCTComponent.h>


@interface SycScrollView : SDCycleScrollView

@property (nonatomic, copy) RCTBubblingEventBlock onClickBanner; //通过RCTBubblingEventBlock 将事件导出 给js 调用 ，
                                                                    //方法名必须 以on 开头

@property (nonatomic, copy) RCTBubblingEventBlock onDidScrollerBanner;


@property (nonatomic, copy) RCTDirectEventBlock onClickView;
@property (nonatomic, strong) NSDictionary *dict;
@end
