//
//  ZShareViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2018/7/23.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import "ZShareViewController.h"

@interface ZShareViewController ()

@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture;
@property (nonatomic, strong) UIView *blueView;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *iconView;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation ZShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self addGes];
    [self setupUI];
    [self.view addGestureRecognizer:self.pinchGesture];
    // Do any additional setup after loading the view.
}

- (void) setupUI {
    self.blueView = [UIView new];
    [self.view addSubview:self.blueView];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.blueView.frame =CGRectMake(100, 200, 50, 50);
    
    self.lineView = [UIView new];
    [self.view addSubview:self.lineView];
    self.iconView = [UIView new];
    [self.view addSubview:self.iconView];
    self.lineView.frame = CGRectMake(200, 200, 3, 100);
    self.lineView.backgroundColor = [UIColor yellowColor];
    self.iconView.frame =CGRectMake(200-3.5, 200, 10, 10);
    self.iconView.backgroundColor = [UIColor redColor];
    
    self.slider = [[UISlider alloc] init];
    self.slider.frame = CGRectMake(220, 200, 200, 10);
    self.slider.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.slider];
    self.slider.maximumValue = 4;
    self.slider.minimumValue = 1;
    self.slider.minimumTrackTintColor = [UIColor whiteColor];
    self.slider.maximumTrackTintColor = [UIColor whiteColor];
    self.slider.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.slider setThumbImage:[UIImage imageNamed:@"image_video"] forState:UIControlStateNormal];
    
}

- (void) addGes {
    self.pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
}
- (void) gestureAction:(UIPinchGestureRecognizer*) ges {
    NSLog(@"gestureAction %lf",ges.scale);
    float width =self.blueView.frame.size.width;
    if (width < 50 && ges.scale < 1) {
        ges.scale = 1;
        return;
    }
    if (width > 200 && ges.scale > 1) {
        ges.scale = 1;
        return;
    }
    
    self.blueView.transform=CGAffineTransformScale(self.blueView.transform, ges.scale, ges.scale);
//    self.iconView.center = CGPointMake(self.iconView.center.x, self.iconView.center.y * ges.scale);
    [self.slider setValue:(width)/50];
    ges.scale = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
