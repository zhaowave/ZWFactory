//
//  GPUUsageLable.m
//  ZWFactory
//
//  Created by zhaowei on 2020/2/6.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import "GPUUsageLable.h"
#import "ZGPUMonitor.h"

#define kGPUUsageLableSize CGSizeMake(55, 20)

@implementation GPUUsageLable{
    NSTimer *_timer;
    UIFont *_font;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kGPUUsageLableSize;
    }
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
    
    _font = [UIFont fontWithName:@"Menlo" size:14];
    __weak __typeof(self) wself = self;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [wself tick];
    }];
    return self;
}

- (void)tick {
    NSInteger pro = [ZGPUMonitor gpuDeviceUsage];
    NSLog(@"xxxx gpu usage :%ld",pro);
    CGFloat progress = pro;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld%%",(long)pro]];
    [text setAttributes:@{NSForegroundColorAttributeName:color} range:NSMakeRange(0, text.length)];
    self.attributedText = text;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return kGPUUsageLableSize;
}

- (void)dealloc {
    [_timer invalidate];
}

@end
