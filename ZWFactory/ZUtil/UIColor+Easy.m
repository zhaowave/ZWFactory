//
//  UIColor+Easy.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/4.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "UIColor+Easy.h"

@implementation UIColor (Easy)

+ (UIColor*) randomColor {
    double red = (arc4random()%256);
    double green = (arc4random()%256);
    double blue = (arc4random()%256);
   return [UIColor colorWithRed:(red/255) green:(green/255) blue:(blue/255) alpha:1.0];
}

@end
