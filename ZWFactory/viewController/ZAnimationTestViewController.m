//
//  ZAnimationTestViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2018/7/28.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import "ZAnimationTestViewController.h"
#import <Masonry/Masonry.h>

@interface ZAnimationTestViewController ()

@property (nonatomic ,strong) UIButton *startView;
@property (nonatomic ,strong) UIImageView *endView;
@property (nonatomic ,strong) UIButton *aniButton;

@end

@implementation ZAnimationTestViewController
int count;
- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void) setupUI {
    self.view.backgroundColor = ZW_WHITE;
    self.startView = [[UIButton alloc] init];
    [self.startView setImage:[UIImage imageNamed:@"image_video"] forState:UIControlStateNormal];
    self.startView.layer.cornerRadius = 50;
    [self.view addSubview:self.startView];
    self.startView.backgroundColor = [UIColor clearColor];
    self.endView = [[UIImageView alloc] init];
    [self.view addSubview:self.endView];
    [self.startView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    self.aniButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.aniButton setTitle:@"开始" forState:UIControlStateNormal];
    self.aniButton.backgroundColor = [UIColor yellowColor];
    [self.aniButton addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.aniButton];
    [self.aniButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 100));
        make.top.mas_equalTo(self.startView.mas_bottom).offset(100);
    }];
}

- (void) btnEvent {
    count++;
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    transition.type = kCATransitionFade;
    [self.startView.layer addAnimation:transition forKey:@"a"];
    if(count %2 == 0){
         [self.startView setImage:[UIImage imageNamed:@"image_video"] forState:UIControlStateNormal];
    } else {
        [self.startView setImage:[UIImage imageNamed:@"image_photo"] forState:UIControlStateNormal];
    }

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
