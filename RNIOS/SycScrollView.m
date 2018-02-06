//
//  SycScrollView.m
//  demo
//
//  Created by syc on 2018/2/2.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "SycScrollView.h"

@implementation SycScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    NSLog(@"%@",dict);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    self.onClickView(@{@"牛逼":@"毛哥哥"});
    
}

@end
