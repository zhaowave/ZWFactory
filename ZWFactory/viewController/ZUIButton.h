//
//  ZUIButton.h
//  ZWFactory
//
//  Created by zhaowei on 2019/4/4.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^buttonAction)(void);


@interface ZUIButton : UIButton

@property (nonatomic, copy) buttonAction clickedAction;


@end
