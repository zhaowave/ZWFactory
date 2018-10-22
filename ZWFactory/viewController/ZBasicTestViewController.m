//
//  ZBasicTestViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2018/8/3.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import "ZBasicTestViewController.h"
#import "MVButton.h"

@interface ZBasicTestViewController ()

@end

@implementation ZBasicTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    MVButton *btn = [[MVButton alloc] init];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.title = @"故事的最后";
    btn.center = CGPointMake(50, 100);
    MVButton *btn1 = [[MVButton alloc] init];
    btn1.title = @"关于爱";
    btn1.center = CGPointMake(100, 100);
    [self.view addSubview:btn];
    [self.view addSubview:btn1];
    // Do any additional setup after loading the view.
}

- (void) btnClicked {
    NSLog(@"btnClicked");
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
