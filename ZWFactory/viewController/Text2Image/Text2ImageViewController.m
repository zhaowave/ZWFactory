//
//  Text2ImageViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2020/2/18.
//  Copyright © 2020 zhaowei. All rights reserved.
//

#import "Text2ImageViewController.h"
#import <AVFoundation/AVFoundation.h>


@implementation classA

- (void) mathodA {
    NSLog(@"classA mathodA");
}

@end

@implementation classB

- (void) mathodB {
    NSLog(@"mathodB");
}

- (void) mathodA {
    NSLog(@"classB mathodA");
}

@end

@interface Text2ImageViewController ()

@property(nonatomic) UIImageView* imgView;

@end

@implementation Text2ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    classA *c = [[classB alloc] init];
    [c mathodA];
    
    int val = 1;
    void (^blk)(void) = ^{
        printf("%d\n", val);
    };
    val = 2;
    blk();
//    [c me]
    
//    NSString *string = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
//
//    NSDictionary *attributes = @{NSFontAttributeName            : [UIFont systemFontOfSize:20],
//                                 NSForegroundColorAttributeName : [UIColor blueColor],
//                                 NSBackgroundColorAttributeName : [UIColor clearColor]};
//
//    UIImage *image = [self imageFromString:string attributes:attributes size:CGSizeMake(100, 200)];
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
//
//    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/a.jpg"];
//
//    [imageData writeToFile:path atomically:NO];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        UIApplicationState state = [[UIApplication sharedApplication] applicationState];
//        NSLog(@"state %ld",(long)state);
//    });
    self.imgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.imgView];
    
    
    // Do any additional setup after loading the view.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self buildAVAssetReader];
}

//- (NSAttributedString *) originalText {
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString: @"hello,world!"];
//    [text addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20],
//    NSForegroundColorAttributeName : [UIColor blueColor],
////    NSBackgroundColorAttributeName : [UIColor clearColor]} range:<#(NSRange)#>]
//    return text;
//}
- (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGFloat scale = [UIScreen mainScreen].scale;
    [string drawInRect:CGRectMake(0, 0, size.width * scale, size.height * scale) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
//https://blog.csdn.net/u014084081/article/details/73738871?locationNum=3&fps=1
- (void) buildAVAssetReader {
    NSString *srcPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/rocket720.mp4"];
    NSURL *srcURL = [NSURL fileURLWithPath:srcPath];
    if(![[NSFileManager defaultManager] fileExistsAtPath:srcPath]){
        NSLog(@"file not exist!");
        return;
    }
    AVAsset *asset = [AVAsset assetWithURL:srcURL];
    NSArray *trackArray = [asset tracksWithMediaType:AVMediaTypeVideo];
    
    AVAssetReader *reader = [[AVAssetReader alloc] initWithAsset:asset error:nil];
    
    AVAssetReaderTrackOutput *readerTrackOutput = [[AVAssetReaderTrackOutput alloc] initWithTrack:[trackArray firstObject] outputSettings:@{(__bridge id)kCVPixelBufferPixelFormatTypeKey:@(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)}];
    if(![reader canAddOutput:readerTrackOutput]){
        return;
    }
    [reader addOutput:readerTrackOutput];
    [reader startReading];
    
    int frameIndex = 0;
    CFTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
    while (YES) {
        @autoreleasepool {
            
            CMSampleBufferRef sampleBuffer = [readerTrackOutput copyNextSampleBuffer];
            
            if (sampleBuffer) {
                UIImage* image = [self imageFromSampleBuffer:sampleBuffer];
                [self.imgView setImage:image];
                CFRelease(sampleBuffer);
                sampleBuffer = NULL;
                frameIndex++;

            } else {
                if (reader.status == AVAssetReaderStatusFailed) {
                    NSError *failureError = reader.error;
                    NSLog(@"%@",failureError);
                } else {
                    break;
                }
            }
        }
    }
    CFTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
    NSLog(@"----%d--time:%lf",frameIndex, 1000*(endTime - startTime));
    
    [reader cancelReading];
    
}

- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{
    NSParameterAssert(sampleBuffer);
    
    if (!sampleBuffer) {
        return nil;
    }
    
    // Get a CMSampleBuffer's Core Video image buffer for the media data
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // Get the number of bytes per row for the pixel buffer
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    
    // Get the number of bytes per row for the pixel buffer
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // Create a device-dependent RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Create a bitmap graphics context with the sample buffer data
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                 bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    if (!context)
    {
        CGColorSpaceRelease(colorSpace);
        return nil;
    }
    
    // Create a Quartz image from the pixel data in the bitmap graphics context
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    // Unlock the pixel buffer
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
    
    // Free up the context and color space
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // Create an image object from the Quartz image
    UIImage *image = [UIImage imageWithCGImage:quartzImage];
    
    // Release the Quartz image
    CGImageRelease(quartzImage);
    
    return (image);
}

@end
