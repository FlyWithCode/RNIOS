//
//  RNTMLView.m
//  RNIOS
//
//  Created by syc on 2018/2/6.
//  Copyright © 2018年 syc. All rights reserved.
//

#import "RNTMLView.h"

@implementation RNTMLView

//模拟RN使用原生组件回传数据到oc
- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    NSLog(@"%@",dict);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.onClickView(@{@"牛逼":@"毛哥哥"});//模拟原生回传数据给RN

//    __weak typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        weakSelf.onClickView(@{@"牛逼":@"毛哥哥"});
//    });
    
}


/**
 只要实现了该方法并返回了特定的线程，
 那么该类下所有的方法在被RN调用时都会自觉的运行在该方法指定的线程下。
 */
- (dispatch_queue_t)methodQueue{
    return dispatch_get_main_queue();
}
@end
