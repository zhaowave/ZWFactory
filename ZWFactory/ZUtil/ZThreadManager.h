//
//  ZThreadManager.h
//  ZWFactory
//
//  Created by wei zhao on 2019/4/5.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^blk)(void);

@interface ZThreadManager : NSObject

singleton(ZThreadManager)

+ (void) runInMainQueue:(blk) doSomething;
+ (void) runInGlobalQueue:(blk) doSomething;

@end

NS_ASSUME_NONNULL_END
