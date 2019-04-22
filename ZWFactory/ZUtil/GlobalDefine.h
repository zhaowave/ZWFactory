//
//  GlobalDefine.h
//  ZWFactory
//
//  Created by zhaowei on 2019/4/4.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

//日志
#ifdef DEBUG
#define LOG_INFO(...) NSLog(__VA_ARGS__)
#else
#define LOG_INFO(...)
#endif

//强弱引用
#define W_SELF __weak __typeof(self) wself = self
#define S_SELF __strong typeof(self) self = wself

//机器相关参数
#define DEVICEVERSION [UIDevice currentDevice].systemVersion
#define DEVICENAME [UIDevice currentDevice].systemName

#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define ScreenRatioWidth  (kFSCREEN_WIDTH / 375.0)
#define ScreenRatioHeight (kFSCREEN_HEIGHT / 667.0)

//单例宏定义实现
#define singleton(className)    \
                                \
+ (className*) sharedInstance;  \

#define singleton_imp(className,initblk)        \
                                                \
+ (className *) sharedInstance {                 \
    static className *instance;                  \
    static dispatch_once_t token;               \
    dispatch_once(&token, ^{                    \
    instance = [[className alloc] init];        \
        if(instance) {                          \
            initblk                             \
        }                                       \
    }                                           \
    );                                          \
    return instance;                            \
}                                               \




#endif /* GlobalDefine_h */
