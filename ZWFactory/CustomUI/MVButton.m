//
//  MVButton.m
//  500w_ios
//
//  Created by zhaowei on 2018/8/24.
//  Copyright © 2018年 boom. All rights reserved.
//

#import "MVButton.h"

@interface MVButton()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *selectedImage;

@end

@implementation MVButton

- (instancetype) init {
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}


- (instancetype) initWithTitle:(NSString *) title {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        [self setupUI];
        self.title = title;
    }
    return self;
}

- (void) setupUI {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.userInteractionEnabled = YES;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
    [self addSubview:self.titleLabel];
    self.selectedImage = [[UIImageView alloc] init];
    self.selectedImage.userInteractionEnabled = YES;
    self.selectedImage.hidden = NO;
    self.selectedImage.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self addSubview:self.selectedImage];
}

- (void) setTitle:(NSString *)title {
    _title = title;
    CGRect rect = [_title boundingRectWithSize:CGSizeMake(MAXFLOAT, 14) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:12]} context:nil];
    CGSize size = rect.size;
    self.titleLabel.text = title;
    self.titleLabel.frame = CGRectMake(0, 0, size.width, size.height);
    self.selectedImage.frame = CGRectMake(0, size.height + 4, size.width, 5);
    
    self.frame = CGRectMake(0, 0, size.width, size.height+4+5);
}

- (void) setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.selectedImage.hidden = NO;
    } else {
        self.selectedImage.hidden = YES;
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
