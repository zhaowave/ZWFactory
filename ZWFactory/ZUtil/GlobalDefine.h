//
//  GlobalDefine.h
//  ZWFactory
//
//  Created by zhaowei on 2019/4/4.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

#ifdef DEBUG
#define LOG_INFO(...) NSLog(__VA_ARGS__)
#else
#define LOG_INFO(...)
#endif

#define W_SELF __weak __typeof(self) wself = self
#define S_SELF __strong typeof(self) self = wself

#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define ScreenRatioWidth  (kFSCREEN_WIDTH / 375.0)
#define ScreenRatioHeight (kFSCREEN_HEIGHT / 667.0)


#endif /* GlobalDefine_h */
