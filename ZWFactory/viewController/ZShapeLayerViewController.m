//
//  ZShapeLayerViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2018/8/22.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import "ZShapeLayerViewController.h"

@interface ZShapeLayerViewController ()

@end

@implementation ZShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self lineBeizier];
    [self rectangleBeizier];
    
    // Do any additional setup after loading the view.
}
//i
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) lineBeizier {
    //   创建一个路径对象
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    //  起点
    [linePath moveToPoint:(CGPoint){20,20}];
    // 其他点
    [linePath addLineToPoint:(CGPoint){160,160}];
    [linePath addLineToPoint:(CGPoint){180,50}];
    [linePath closePath];
    //  设置路径画布
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = (CGRect){0,0,200,200};
    lineLayer.position = self.view.center;
    lineLayer.lineWidth = 2.0;
    lineLayer.strokeColor = [UIColor orangeColor].CGColor; //   边线颜色
//    lineLayer.fillColor = [UIColor redColor].CGColor;
    lineLayer.path = linePath.CGPath;
    [self.view.layer addSublayer:lineLayer];
}

- (void) rectangleBeizier {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:(CGRect){40,40,20,20}];
    CAShapeLayer *rectLayer = [CAShapeLayer layer];
    rectLayer.backgroundColor = [UIColor grayColor].CGColor;
    rectLayer.path = path.CGPath;
    rectLayer.bounds = (CGRect){0,0,100,100};
    rectLayer.position = CGPointMake(100, 100);
    rectLayer.lineWidth = 3;
    rectLayer.strokeColor = [UIColor blueColor].CGColor;
    rectLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:rectLayer];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
