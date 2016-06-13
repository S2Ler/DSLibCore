//
//  DSDynamicPropertyObject.h
//  DSLib
//
//  Created by Alexander Belyavskiy on 2/5/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface DSDynamicPropertyObject : NSObject<NSCoding>
@property (nonatomic, strong, nonnull) NSObject<NSCoding> *container;

- (instancetype)initWithContainer:(nonnull NSObject<NSCoding> *)container;

- (nullable id)containerValueForKeyPath:(nonnull NSString *)keyPath;

- (nonnull NSDictionary *)allValues;
@end

@interface DSDynamicPropertyObject (Abstract)

/** Needed for dynamic getter resolution.
 Usage:
 - create readonly property
 - overwrite keypathForGetter: method to return keypath in responseDictionary for this property
 - look into forwardInvocation: if some of the property types isn't supported and add a new handler
 */
- (nonnull NSString *)keypathForGetter:(nonnull NSString *)getter;

- (nullable NSString *)dateFormatForGetter:(nonnull NSString *)getter;
@end

NS_ASSUME_NONNULL_END
