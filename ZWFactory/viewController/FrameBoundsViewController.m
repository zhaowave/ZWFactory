//
//  FrameBoundsViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2020/3/30.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import "FrameBoundsViewController.h"

@interface FrameBoundsViewController ()
@property(nonatomic, copy) NSArray *viewArray;
@property(nonatomic) NSTimer *timer;

@end

@implementation FrameBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *v1 = [UIView new];
    v1.backgroundColor = [UIColor redColor];
    v1.frame = CGRectMake(0,0, 100, 100);
    
    UIView *v2 = [UIView new];
    v2.backgroundColor = [UIColor yellowColor];
    v2.frame = CGRectMake(0,110, 100, 100);
    
    UIView *v3 = [UIView new];
    v3.backgroundColor = [UIColor blueColor];
    v3.frame = CGRectMake(0,220, 100, 100);
    
    UIView *v4 = [UIView new];
    v4.backgroundColor = [UIColor greenColor];
    v4.frame = CGRectMake(0,330, 100, 100);
    
    UIView *v5 = [UIView new];
    v5.backgroundColor = [UIColor purpleColor];
    v5.frame = CGRectMake(0,440, 100, 100);
    
    UIView *v6 = [UIView new];
    v6.backgroundColor = [UIColor brownColor];
    v6.frame = CGRectMake(0,550, 100, 100);
    
    self.viewArray = @[v1,v2,v3,v4,v5,v6];
    for (UIView* v in self.viewArray) {
        [self.view addSubview:v];
    }
    __block float pos = 0.f;
    __block float s = 0.1f;
    __weak typeof(self) wself = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        pos += 10.;
        wself.view.bounds = CGRectMake(0., pos , self.view.bounds.size.width, self.view.bounds.size.height);
        s = s*1.1;
        
        CGAffineTransform trans1 = CGAffineTransformMakeScale(s, 1.);
        CGAffineTransform trans = CGAffineTransformMakeRotation(s);
        UIView *view = wself.viewArray.lastObject;
        [view.layer setAffineTransform:trans];
        [view.layer setAffineTransform:trans1];
    }];
    
    // Do any additional setup after loading the view.
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
