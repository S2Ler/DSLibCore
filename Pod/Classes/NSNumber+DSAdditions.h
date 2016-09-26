//
//  NSNumber+DSAdditions.h
//  DSLib
//
//  Created by Alexander Belyavskiy on 2/10/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

@import Foundation;
#import "DSConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (DSAdditions)
- (DSFileSize)fileSizeValue;
+ (instancetype)numberWithFileSize:(DSFileSize)fileSize;

- (DSRecID)recIDValue;
+ (instancetype)numberWithRecID:(DSRecID)recID;
@end


NS_ASSUME_NONNULL_END
