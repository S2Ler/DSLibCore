//
//  DSWeakTimerTarget.h
//  DSLib
//
//  Created by Alexander Belyavskiy on 12/8/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/**
 Usage:
 DSWeakTimerTarget *weakTarget = [[DSWeakTimerTarget alloc] initWithTarget:YOUR_TARGET
                                                                  selector:@selector(YOUR_SELECTOR)];
 NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                   target:weakTarget
                                                 selector:@selector(timerDidFire:)
                                                 userInfo:nil
                                                  repeats:NO];
 */
@interface DSWeakTimerTarget : NSObject
- (instancetype)initWithTarget:(id)target selector:(SEL)sel;
- (void)timerDidFire:(NSTimer *)timer;
@end

NS_ASSUME_NONNULL_END
