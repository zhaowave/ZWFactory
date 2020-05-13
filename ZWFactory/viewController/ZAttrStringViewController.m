//
//  ZAttrStringViewController.m
//  ZWFactory
//
//  Created by wei zhao on 2018/7/29.
//  Copyright © 2018 zhaowei. All rights reserved.
//

#import "ZAttrStringViewController.h"

#define ZW_USER_PROTOCOL_WORD @"您已经阅读并同意有关《用户协议》和《隐私协议》"

@interface ZAttrStringViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic) DisplayLinkObj *linkObj;

@end

@implementation ZAttrStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    short input = 1000;
    NSLog(@"sizeof shrot %lu",sizeof(input));
    for (int i = 0; i < 2; i++) {
        short tmp = input>>(i * 8);
        
        NSLog(@"part %d : %d",i,tmp&0x00FF);
    }
    
    [self setupUI];
    self.linkObj = [[DisplayLinkObj alloc] init];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    NSLog(@"dealloc called!");
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear called!");
}


- (void) setupUI {
    self.view.backgroundColor = ZW_WHITE;
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    self.textView.editable = NO;
    self.textView.userInteractionEnabled = YES;
    self.textView.selectable = NO;
    self.textView.delegate = self;
    self.textView.scrollEnabled = NO;
    [self.view addSubview:self.textView];
    self.textView.attributedText = [self buildAttrString];
}

- (NSMutableAttributedString *) buildAttrString {
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:ZW_USER_PROTOCOL_WORD];
    //设置下划线
    [attrStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:[[attrStr string] rangeOfString:@"隐私协议"]];
    [attrStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:[[attrStr string] rangeOfString:@"用户协议"]];
    //设置字体，和颜色
    [attrStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor],NSFontAttributeName:[UIFont systemFontOfSize:12]} range:NSMakeRange(0, [attrStr string].length)];
    //行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[attrStr string] length])];
    //字间距
    [attrStr addAttribute:NSKernAttributeName value:[NSNumber numberWithInteger:-1] range:NSMakeRange(0,[[attrStr string] length])];
    
    //增加超链接
    [attrStr addAttributes:@{NSLinkAttributeName:[NSURL URLWithString:@"userp://"]} range:[[attrStr string] rangeOfString:@"用户协议"]];
    [attrStr addAttributes:@{NSLinkAttributeName:[NSURL URLWithString:@"privatep://"]} range:[[attrStr string] rangeOfString:@"隐私协议"]];
    return attrStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction NS_AVAILABLE_IOS(10_0) {
    NSLog(@"%@",URL);
    //根据url 跳转到不同的位置
    return NO;
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

@implementation DisplayLinkObj

-(instancetype) init {
    if (self = [super init]) {
        self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkCallback:)];
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void) displayLinkCallback:(id) sender {
    NSLog(@"displayLinkCallback called!");
}

-(void) clear {
    NSLog(@"DisplayLinkObj clear called!");
    [self.link invalidate];
    self.link = nil;
}
- (void) dealloc {
    [self clear];
    NSLog(@"DisplayLinkObj dealloc called!");
}

@end
