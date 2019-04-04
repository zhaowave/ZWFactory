//
//  ZFileManager.m
//  ZWFactory
//
//  Created by wei zhao on 2019/3/29.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "ZFileManager.h"

@implementation ZFileManager

+ (instancetype) sharedManager {
    static ZFileManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[ZFileManager alloc] init];
        }
    });
    return manager;
}

+ (NSString *) documentDirectory {
    NSString *doc = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return doc;
}

+ (BOOL) isFileExist:(NSString*) fileName {
    if ([[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        return YES;
    }
    return NO;
}



@end
