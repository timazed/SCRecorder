//
//  SCPhotoConfiguration.m
//  SCRecorder
//
//  Created by Simon CORSIN on 24/11/14.
//  Copyright (c) 2014 rFlex. All rights reserved.
//

#import "SCPhotoConfiguration.h"

@implementation SCPhotoConfiguration

- (id)init {
    self = [super init];
    
    if (self) {
        _enabled = YES;
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 10000
        _photoSettings = [AVCapturePhotoSettings photoSettingsWithFormat:@{AVVideoCodecKey: AVVideoCodecJPEG}];
#endif
    }
    
    return self;
}

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 10000

- (void)setOptions:(NSDictionary *)options {
    [self willChangeValueForKey:@"options"];
    
    _options = options;
    
    [self didChangeValueForKey:@"options"];
}

- (NSDictionary *)createOutputSettings {
    if (_options == nil) {
        return @{AVVideoCodecKey : AVVideoCodecJPEG};
    } else {
        return _options;
    }
}

#endif

-(void)createPhotoSettingsClone NS_AVAILABLE_IOS(10) {
    AVCapturePhotoSettings *newSettings = [AVCapturePhotoSettings photoSettingsWithFormat:@{AVVideoCodecKey: AVVideoCodecJPEG}];
    newSettings.flashMode = _photoSettings.flashMode;
    _photoSettings = newSettings;
}


@end
