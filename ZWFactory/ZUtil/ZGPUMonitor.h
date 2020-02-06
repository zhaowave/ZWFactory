//
//  ZGPUMonitor.h
//  ZWFactory
//
//  Created by zhaowei on 2020/2/6.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGPUMonitor : NSObject

/**
 https://perfdog.qq.com/support
 1) Render：渲染器利用率(像素着色处理阶段，若占比高，说明是PS阶段出现瓶颈，shader过于复杂或纹理大小、采样复杂等)
 2) Tilter:Tilter利用率(顶点着色处理阶段，若占比高，说明是VS阶段出现瓶颈，顶点数太多等原因)
 3) Device:设备利用率(整体GPU利用率)
 */

@property(nonatomic, readonly) NSInteger deviceGPURenderUsage;
@property(nonatomic, readonly) NSInteger deviceGPUTilerUsage;
@property(nonatomic, readonly) NSInteger deviceGPUDeviceUsage;

+(NSInteger)gpuRenderUsage;
+(NSInteger)gpuTilerUsage;
+(NSInteger)gpuDeviceUsage;

+(instancetype) sharedInstance;

+(NSDictionary*) gpuUsageDictionary;

@end

NS_ASSUME_NONNULL_END
