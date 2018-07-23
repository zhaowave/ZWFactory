//
//  ZTestItem.m
//  ZWFactory
//
//  Created by zhaowei on 2018/7/23.
//  Copyright © 2018年 zhaowei. All rights reserved.
//

#import "ZTestItem.h"
#import <YYModel/YYModel.h>

@implementation ZTestItem
@end

@implementation ZTestDataManager

static ZTestDataManager *_manager = nil;
+ (instancetype) sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

- (NSArray *) loadTestItems {
    NSArray *datas;
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    datas = [NSArray arrayWithContentsOfFile:plistPath];
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:datas.count];
    for (NSDictionary *dict in datas) {
        ZTestItem *item = [ZTestItem yy_modelWithDictionary:dict];
        [mutableArray addObject:item];
    }
    return [NSArray arrayWithArray:mutableArray];
}

@end
