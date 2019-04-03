//
//  ZUIView.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/3.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZUIView.h"

@implementation ZUIView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        return self;
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [touch locationInView:self];
    NSLog(@"ddd");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    touches
}

@end
