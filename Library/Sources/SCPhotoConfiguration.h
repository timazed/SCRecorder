//
//  SCPhotoConfiguration.h
//  SCRecorder
//
//  Created by Simon CORSIN on 24/11/14.
//  Copyright (c) 2014 rFlex. All rights reserved.
//

#import "SCMediaTypeConfiguration.h"


/**
 * TODO: Make this AVCapturePhotoSettings be created on each request.
 * Create a set method for options that are stored in a map then create whats necessary depending on platform version.
 **/
@interface SCPhotoConfiguration : NSObject

/**
 Whether the photo output is enabled or not.
 Changing this value after the session has been opened
 on the SCRecorder has no effect.
 */
@property (assign, nonatomic) BOOL enabled;

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 10000
/**
 If set, every other properties but "enabled" will be ignored
 and this options dictionary will be used instead.
 */
@property (copy, nonatomic) NSDictionary *__nullable options;

/**
 Returns the output settings for the
 */
- (NSDictionary *__nonnull)createOutputSettings;

#elif __IPHONE_OS_VERSION_MAX_ALLOWED >= 10000

/**
 * iOS 10 plus capture settings
 */

@property (readonly, nonatomic) AVCapturePhotoSettings *__nonnull photoSettings;

-(void)createPhotoSettingsClone;

#endif

@end
