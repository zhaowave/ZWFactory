//
//  ZThreadManager.m
//  ZWFactory
//
//  Created by wei zhao on 2019/4/5.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZThreadManager.h"

@implementation ZThreadManager

singleton_imp(ZThreadManager, {
    
})

+ (void) runInMainQueue:(blk) doSomething {
    if ([NSThread isMainThread]) {
        doSomething();
    } else {
        dispatch_async(dispatch_get_main_queue(),doSomething);
    }
}

+ (void) runInGlobalQueue:(blk) doSomething {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), doSomething);
}

@end
