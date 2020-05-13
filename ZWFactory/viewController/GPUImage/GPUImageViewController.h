//
//  GPUImageViewController.h
//  ZWFactory
//
//  Created by zhaowei on 2020/3/30.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import "ZViewController.h"
#import <GPUImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface GPUImageViewController : ZViewController
@property(nonatomic) GPUImageVideoCamera *videoCamera;
@property(nonatomic) GPUImageOutput<GPUImageInput> *filter;
@property(nonatomic) GPUImageMovieWriter *movieWriter;
@end

NS_ASSUME_NONNULL_END
