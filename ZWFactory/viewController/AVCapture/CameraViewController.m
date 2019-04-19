//
//  CameraViewController.m
//  ZWFactory
//
//  Created by zhaowei on 2019/4/19.
//  Copyright © 2019 zhaowei. All rights reserved.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>

#import "VideoOutputDelegate.h"

@interface CameraViewController ()
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDevice *videoDevice;
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoOutput;
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;
@property (nonatomic, strong) AVCaptureConnection *videoConnection;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic) dispatch_queue_t videoQueue;
@property (nonatomic) VideoOutputDelegate *delegate;
@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
    _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.captureSession];
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    _previewLayer.frame = view.bounds;
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_previewLayer];
    // Do any additional setup after loading the view.
}


- (void) setUp {
    self.navigationController.navigationBarHidden = YES;
    self.delegate = [[VideoOutputDelegate alloc] init];
    [self.captureSession startRunning];
}

- (AVCaptureSession*) captureSession {
    if (!_captureSession) {
        _captureSession = [AVCaptureSession new];
        [_captureSession setSessionPreset:AVCaptureSessionPreset1280x720];
        [_captureSession addInput:self.videoInput];
        [_captureSession addOutput:self.videoOutput];
    }
    return _captureSession;
}

- (AVCaptureDevice*) videoDevice {
    if (!_videoDevice) {
        _videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    return _videoDevice;
}

- (AVCaptureDeviceInput *) videoInput {
    if (!_videoInput) {
        NSError *error;
        _videoInput = [AVCaptureDeviceInput deviceInputWithDevice:self.videoDevice error:&error];
    }
    return _videoInput;
}

- (AVCaptureVideoDataOutput *) videoOutput {
    if (!_videoOutput) {
        _videoOutput = [[AVCaptureVideoDataOutput alloc] init];
        self.videoQueue = dispatch_queue_create("myVideoQueue", NULL);
        [_videoOutput setSampleBufferDelegate:self.delegate queue:self.videoQueue];
        _videoConnection = [_videoOutput connectionWithMediaType:AVMediaTypeVideo];
        _videoConnection.preferredVideoStabilizationMode = AVCaptureVideoStabilizationModeAuto;

    }
    return _videoOutput;
}

- (BOOL) prefersStatusBarHidden {
    return YES;
}


//_videoConnection = [_captureVideoDataOutput connectionWithMediaType:AVMediaTypeVideo];
//
//_videoConnection.videoOrientation = AVCaptureVideoOrientationPortrait;

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
