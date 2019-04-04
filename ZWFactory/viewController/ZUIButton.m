//
//  ZUIButton.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/4.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZUIButton.h"

@implementation ZUIButton


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    LOG_INFO(@"fjkdlsa;");
    if([self pointInside:point withEvent:event]){
        return self;
    }

    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
