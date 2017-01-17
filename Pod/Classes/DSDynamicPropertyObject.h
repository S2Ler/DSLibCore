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

/// Maps getter name to custom selector of this subclass which can transform container value to getter type
@property (nonatomic, strong, nullable, readonly) NSDictionary<NSString*, NSString*> *customGetterNameToSelectorMap;

- (instancetype)initWithContainer:(nonnull NSObject<NSCoding> *)container;

- (nullable id)containerValueForKeyPath:(nonnull NSString *)keyPath;

- (nonnull NSDictionary *)allValues;


/**
 Used only in default keypathForGetter implementation.
 @see keypathForGetter:
 */
@property (nonatomic, strong, nullable) NSDictionary<NSString*, NSString*> *getterToKeypathMap;

#pragma mark - Accessors
- (NSInteger)handleIntegerWithName:(NSString *)getterName;
- (NSUInteger)handleUnsignedIntegerWithName:(NSString *)getterName;
- (NSNumber *)numberForGetterName:(NSString *)getterName;
- (double)handleDoubleWithName:(NSString *)getterName;
- (unsigned long long)handleUnsignedLongLongWithName:(NSString *)getterName;
- (long long)handleLongLongWithName:(NSString *)getterName;
- (char)handleCharWithName:(NSString *)getterName;
- (short)handleShortWithName:(NSString *)getterName;
- (BOOL)handleBOOLWithName:(NSString *)getterName;
- (id)handleObjectGetterWithName:(NSString *)getterName;
- (nullable NSNumber *)handleStringToNumberGetterWithName:(NSString *)getterName;
- (nullable NSDate *)handleStringToDateGetterWithName:(NSString *)getterName;
- (nullable NSURL *)handleObjectToNSURLGetterWithName:(NSString *)getterName;
- (nullable NSString *)handleObjectToStringGetterWithName:(NSString *)getterName;
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
