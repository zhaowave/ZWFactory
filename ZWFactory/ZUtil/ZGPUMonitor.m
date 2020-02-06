//
//  ZGPUMonitor.m
//  ZWFactory
//
//  Created by zhaowei on 2020/2/6.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import "ZGPUMonitor.h"
#import "IOKit.h"


// registry plane names
#define kIOServicePlane                 "IOService"

/**
 2020-02-06 19:33:35.144343+0800 ZWFactory[14764:4066152] 1:==stdTextureCreationBytes--0==
 2020-02-06 19:33:35.144613+0800 ZWFactory[14764:4066152] 2:==SplitSceneCount--2==
 2020-02-06 19:33:35.144769+0800 ZWFactory[14764:4066152] 3:==Device Utilization %--36==
 2020-02-06 19:33:35.144916+0800 ZWFactory[14764:4066152] 4:==finishGLWaitTime--0==
 2020-02-06 19:33:35.145092+0800 ZWFactory[14764:4066152] 5:==recoveryCount--0==
 2020-02-06 19:33:35.145232+0800 ZWFactory[14764:4066152] 6:==gartUsedBytes--108052480==
 2020-02-06 19:33:35.145363+0800 ZWFactory[14764:4066152] 7:==gartMapInBytesPerSample--32735232==
 2020-02-06 19:33:35.145495+0800 ZWFactory[14764:4066152] 8:==freeToAllocGPUAddressWaitTime--0==
 2020-02-06 19:33:35.145626+0800 ZWFactory[14764:4066152] 9:==TiledSceneBytes--536576==
 2020-02-06 19:33:35.145751+0800 ZWFactory[14764:4066152] 10:==Renderer Utilization %--35==
 2020-02-06 19:33:35.145877+0800 ZWFactory[14764:4066152] 11:==Tiler Utilization %--2==
 2020-02-06 19:33:35.146055+0800 ZWFactory[14764:4066152] 12:==agpTextureCreationBytes--2521549==
 2020-02-06 19:33:35.146304+0800 ZWFactory[14764:4066152] 13:==gartMapOutBytesPerSample--32587776==
 2020-02-06 19:33:35.146496+0800 ZWFactory[14764:4066152] 14:==contextGLCount--0==
 2020-02-06 19:33:35.146798+0800 ZWFactory[14764:4066152] 15:==oolTextureCreationBytes--0==
 2020-02-06 19:33:35.147260+0800 ZWFactory[14764:4066152] 16:==CommandBufferRenderCount--490==
 2020-02-06 19:33:35.147422+0800 ZWFactory[14764:4066152] 17:==textureCount--1070==
 2020-02-06 19:33:35.147559+0800 ZWFactory[14764:4066152] 18:==iosurfaceTextureCreationBytes--0==
 2020-02-06 19:33:35.147800+0800 ZWFactory[14764:4066152] 19:==hardwareWaitTime--0==
 2020-02-06 19:33:35.148000+0800 ZWFactory[14764:4066152] 20:==agprefTextureCreationBytes--1818624==
 */

static NSString *const kGPUDeviceUsage =                    @"Device Utilization %";
static NSString *const kGPURendererUsage =                  @"Renderer Utilization %";
static NSString *const kGPUTilerUsage =                     @"Tiler Utilization %";

static NSString *const kGPUTextureCount =                   @"textureCount";
static NSString *const kGPUCommandBufferRenderCount =       @"CommandBufferRenderCount";


@implementation ZGPUMonitor

+(instancetype) sharedInstance {
    static ZGPUMonitor *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ZGPUMonitor alloc] init];
    });
    return instance;
}

+(NSInteger) gpuTilerUsage {
    return [[[self gpuUsageDictionary] objectForKey:kGPUTilerUsage] integerValue];
}
+(NSInteger) gpuDeviceUsage {
    return [[[self gpuUsageDictionary] objectForKey:kGPUDeviceUsage] integerValue];;
}

+(NSInteger) gpuRenderUsage {
    return [[[self gpuUsageDictionary] objectForKey:kGPURendererUsage] integerValue];
}

+(NSDictionary*) gpuUsageDictionary {
    NSDictionary *usageDict;
    
    io_iterator_t it;
    if (IOServiceGetMatchingServices(kIOMasterPortDefault, IOServiceNameMatching("sgx"), &it) == 0) {
        
        for (io_registry_entry_t regEntry = IOIteratorNext(it); regEntry; regEntry = IOIteratorNext(it)) {
            
            io_iterator_t innerIterator;
            if (IORegistryEntryGetChildIterator(regEntry, kIOServicePlane, &innerIterator) == 0) {
                
                for (io_registry_entry_t gpuEntry = IOIteratorNext(innerIterator); gpuEntry ; gpuEntry = IOIteratorNext(innerIterator)) {
                    CFMutableDictionaryRef serviceDictionary;
                    if (IORegistryEntryCreateCFProperties(gpuEntry, &serviceDictionary, kCFAllocatorDefault, kNilOptions) != 0) {
                        IOObjectRelease(gpuEntry);
                        continue;
                    }
                    else {
                        usageDict = ((__bridge NSDictionary *)serviceDictionary)[@"PerformanceStatistics"];
                        
                        CFRelease(serviceDictionary);
                        IOObjectRelease(gpuEntry);
                        break;
                    }
                }
                IOObjectRelease(innerIterator);
                IOObjectRelease(regEntry);
                break;
            }
            IOObjectRelease(regEntry);
        }
        IOObjectRelease(it);
    }
    return usageDict;
    
}

@end
