//
//  ZGPUUsageViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2020/2/6.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import "ZGPUUsageViewController.h"
#import "ZGPUMonitor.h"
#import "GPUUsageLable.h"

@interface ZGPUUsageViewController ()
@property (nonatomic, strong) GPUUsageLable *gpuUsageLabel;
@end

@implementation ZGPUUsageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    _gpuUsageLabel = [[GPUUsageLable alloc] initWithFrame:CGRectMake(12, 100, 110, 70)];
//    [_gpuUsageLabel sizeToFit];
//    [[UIApplication sharedApplication].delegate.window addSubview:_gpuUsageLabel];
    [self.view addSubview:_gpuUsageLabel];
    
    
    // Do any additional setup after loading the view.
}


- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
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
