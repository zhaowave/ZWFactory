//
//  ZUIButton.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/4.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZUIButton.h"

@interface ZUIButton ()

@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation ZUIButton

- (instancetype) init {
    if (self = [super init]) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
        [self addGestureRecognizer:tap];
        return self;
    }
    return nil;
}


- (void) clicked:(id) sender {
    
    if (self.clickedAction) {
        W_SELF;
        dispatch_async(dispatch_get_main_queue(), ^{
            wself.backgroundColor = [UIColor randomColor];
        });
        self.clickedAction();
    }
}


//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    LOG_INFO(@"fjkdlsa;");
//    if([self pointInside:point withEvent:event]){
//        return self;
//    }
//
//    return self;
//
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.startPoint = point;
    LOG_INFO(@"began");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LOG_INFO(@"moved");
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self];

    float offsetX = currentPosition.x - self.startPoint.x;
    float offsetY = currentPosition.y - self.startPoint.y;
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);

    if (self.center.x > (self.superview.frame.size.width-self.frame.size.width/2)) {
        CGFloat x = self.superview.frame.size.width-self.frame.size.width/2;
        self.center = CGPointMake(x, self.center.y + offsetY);
    }else if (self.center.x < self.frame.size.width/2){
        CGFloat x = self.frame.size.width/2;
        self.center = CGPointMake(x, self.center.y + offsetY);
    }

    if (self.center.y > (self.superview.frame.size.height-self.frame.size.height/2)) {
        CGFloat x = self.center.x;
        CGFloat y = self.superview.frame.size.height-self.frame.size.height/2;
        self.center = CGPointMake(x, y);
    }else if (self.center.y <= self.frame.size.height/2){
        CGFloat x = self.center.x;
        CGFloat y = self.frame.size.height/2;
        self.center = CGPointMake(x, y);
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
