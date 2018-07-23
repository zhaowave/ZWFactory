//
//  ZTestItem.h
//  ZWFactory
//
//  Created by zhaowei on 2018/7/23.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZTestItem : NSObject

@property (nonatomic, copy) NSString *viewControllerName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;

@end

@interface ZTestDataManager : NSObject

+ (instancetype) sharedInstance;
- (NSArray *) loadTestItems;

@end
