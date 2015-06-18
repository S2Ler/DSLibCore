//
//  DSUnarchiver.h
//  BillingTimer
//
//  Created by Alexander Belyavskiy on 11/30/14.
//  Copyright (c) 2014 Alexander Belyavskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSUnarchiver : NSObject
+ (nullable instancetype)unarchiveObjectFromData:(nullable NSData *)data;
@end
