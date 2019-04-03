//
//  ZHitTestViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/3.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZHitTestViewController.h"
#import "ZUIView.h"

@interface ZHitTestViewController ()
@property (nonatomic) ZUIView *myTestView;
@end

@implementation ZHitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = NO;
    self.myTestView = [[ZUIView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    self.myTestView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myTestView];
    // Do any additional setup after loading the view.
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
