//
//  ZGLViewController.m
//  ZWFactory
//
//  Created by wei zhao on 2019/1/7.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZGLViewController.h"

@interface ZGLViewController ()
@property (nonatomic, strong) EAGLContext* glContext;
@end

@implementation ZGLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) setupGLKView {
    GLKView* view = (GLKView*)self.view;
    _glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    view.context = _glContext;
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    view.drawableStencilFormat = GLKViewDrawableStencilFormat8;
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
