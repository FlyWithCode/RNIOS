//
//  RNTMLView.h
//  RNIOS
//
//  Created by syc on 2018/2/6.
//  Copyright © 2018年 syc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+React.h"
#import <React/RCTComponent.h>

@interface RNTMLView : UIView
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, copy) RCTDirectEventBlock onClickView;

@end
