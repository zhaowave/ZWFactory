//
//  ZHitTestViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/3.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZHitTestViewController.h"
#import "ZUIView.h"
#import "ZUIButton.h"
/**
 事件传递是从当前view到父view到application
 事件响应是从application逐层向下
 */
@interface ZHitTestViewController ()
@property (nonatomic) ZUIView *myTestView;
@property (nonatomic, strong) ZUIButton *myButton;
@end

@implementation ZHitTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.userInteractionEnabled = NO;
    self.myTestView = [[ZUIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.myTestView.backgroundColor = [UIColor redColor];
    
    self.myButton = [[ZUIButton alloc] init];
//    self.myButton.buttonType = UIButtonTypeCustom;
    self.myButton.backgroundColor = [UIColor blueColor];
    self.myButton.frame = CGRectMake(10, 10, 80, 80);
    W_SELF;
    self.myButton.clickedAction = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            wself.myTestView.backgroundColor = [UIColor randomColor];
        });
        
    };
//    self.myButton.userInteractionEnabled = NO;
    [self.myTestView addSubview:self.myButton];
    
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
