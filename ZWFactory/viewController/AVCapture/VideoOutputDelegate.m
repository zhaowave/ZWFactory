//
//  VideoOutputDelegate.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/19.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "VideoOutputDelegate.h"

@implementation VideoOutputDelegate

- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
}

/*!
 @method captureOutput:didDropSampleBuffer:fromConnection:
 @abstract
 Called once for each frame that is discarded.
 
 @param output
 The AVCaptureVideoDataOutput instance that dropped the frame.
 @param sampleBuffer
 A CMSampleBuffer object containing information about the dropped frame, such as its format and presentation time. This sample buffer will contain none of the original video data.
 @param connection
 The AVCaptureConnection from which the dropped video frame was received.
 
 @discussion
 Delegates receive this message whenever a video frame is dropped. This method is called once for each dropped frame. The CMSampleBuffer object passed to this delegate method will contain metadata about the dropped video frame, such as its duration and presentation time stamp, but will contain no actual video data. On iOS, Included in the sample buffer attachments is the kCMSampleBufferAttachmentKey_DroppedFrameReason, which indicates why the frame was dropped. This method will be called on the dispatch queue specified by the output's sampleBufferCallbackQueue property. Because this method will be called on the same dispatch queue that is responsible for outputting video frames, it must be efficient to prevent further capture performance problems, such as additional dropped video frames.
 */
- (void)captureOutput:(AVCaptureOutput *)output didDropSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection API_AVAILABLE(ios(6.0)) {
    
}

@end
