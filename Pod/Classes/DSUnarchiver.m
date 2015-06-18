//
//  DSUnarchiver.m
//  BillingTimer
//
//  Created by Alexander Belyavskiy on 11/30/14.
//  Copyright (c) 2014 Alexander Belyavskiy. All rights reserved.
//

#import "DSUnarchiver.h"

@implementation DSUnarchiver
+ (instancetype)unarchiveObjectFromData:(NSData *)data
{
  if (data == nil) {
    return nil;
  }
  
  @try {
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return object;
  }
  @catch (NSException *exception) {
    return nil;
  }
}
@end
