//
//  NSTimer+DSAdditions.h
//  DSLib
//
//  Created by Diejmon on 9/4/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (DSAdditions)
/** Fires timer and change next fire date to timeinterval since now */
- (void)fireAndReschedule;
@end

NS_ASSUME_NONNULL_END
