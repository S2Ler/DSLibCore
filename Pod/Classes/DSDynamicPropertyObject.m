//
//  DSDynamicPropertyObject.m
//  DSLib
//
//  Created by Alexander Belyavskiy on 2/5/14.
//  Copyright (c) 2014 DS ltd. All rights reserved.
//

#pragma mark - include
#import "DSDynamicPropertyObject.h"
#import "MARTNSObject.h"
#import "RTProperty.h"
#import "DSMacros.h"
#import "NSObject+DSAdditions.h"

@interface DSDynamicPropertyObject ()
@property (nonatomic, strong) NSMutableDictionary *dateFormatters;
@end

@implementation DSDynamicPropertyObject

- (NSDictionary<NSString *,NSString *> *)typeToGetterMap {
  static NSDictionary<NSString *,NSString *> *map = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    map = @{
            @"@\"NSNumber\"": DSKEYPATH(handleStringToNumberGetterWithName:),
            @"@\"NSDate\"": DSKEYPATH(handleStringToDateGetterWithName:),
            @"@\"NSString\"": DSKEYPATH(handleObjectGetterWithName:),
            @"@\"NSDictionary\"": DSKEYPATH(handleObjectGetterWithName:),
            @"@\"NSArray\"": DSKEYPATH(handleObjectGetterWithName:),
            @"I": DSKEYPATH(handleUnsignedIntegerWithName:),
            @"i": DSKEYPATH(handleIntegerWithName:),
            @"Q": DSKEYPATH(handleUnsignedLongLongWithName:),
            @"d": DSKEYPATH(handleDoubleWithName:),
            @"q": DSKEYPATH(handleLongLongWithName:),
            @"B": DSKEYPATH(handleBOOLWithName:),
            @"c": DSKEYPATH(handleCharWithName:)
            };
  });
  return map;
}

- (NSDictionary<NSString *,NSString *> *)customGetterNameToSelectorMap {
  return nil;
}

- (id)initWithContainer:(NSObject<NSCoding> *)container
{
  self = [super init];
  if (self) {
    _container = container;
    _dateFormatters = [[NSMutableDictionary alloc] initWithCapacity:2];
  }
  return self;
}

#pragma mark - dynamic properties
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
  NSString *getterName = NSStringFromSelector([anInvocation selector]);
  
  NSInteger lastParamIndex = 1;
  [anInvocation setArgument:&getterName atIndex:lastParamIndex + 1];
  
  NSString *_Nullable customSelector = self.customGetterNameToSelectorMap[getterName];
  
  if (customSelector) {
    [anInvocation setSelector:NSSelectorFromString(customSelector)];
  }
  else {    
    NSString *type = [self typeForPropertyWithName:getterName];
    NSString *_Nullable mapSelector = [self typeToGetterMap][type];
    if (mapSelector != nil) {
      [anInvocation setSelector:NSSelectorFromString(mapSelector)];
    }
    else if ([type hasPrefix:@"@"]) {
      [anInvocation setSelector:@selector(handleObjectGetterWithName:)];
    }
    UNHANDLED_IF;
  }
  
  [anInvocation invokeWithTarget:self];
}

- (NSString *)typeForPropertyWithName:(NSString *)propertyName
{
  RTProperty *property = [[self class] rt_propertyForName:propertyName];
  NSAssert([property isReadOnly], @"Custom accessors to response dictionary should be readonly properties");
  if (property) {
    NSString *typeEncoding = [property typeEncoding];
    return typeEncoding;
  }
  return nil;
}

+ (NSNumberFormatter *)numberFormatter
{
  DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
    return [[NSNumberFormatter alloc] init];
  });
}

- (NSNumber *)numberForGetterName:(NSString *)getterName
{
  id numberObject = [[self container] ds_jsonValueForKeyPath:[self keypathForGetter:getterName]];
  NSNumber *number = nil;
  
  if ([numberObject isKindOfClass:[NSNumber class]]) {
    number = numberObject;
  }
  else if ([numberObject isKindOfClass:[NSString class]]) {
    number = [[[self class] numberFormatter] numberFromString:numberObject];
  }
  return number;
}

- (NSUInteger)handleUnsignedIntegerWithName:(NSString *)getterName
{
  NSNumber *number = [self numberForGetterName:getterName];
  return [number unsignedIntegerValue];
}

- (NSInteger)handleIntegerWithName:(NSString *)getterName {
  NSNumber *number = [self numberForGetterName:getterName];
  return [number integerValue];
}

- (unsigned long long)handleUnsignedLongLongWithName:(NSString *)getterName
{
  NSNumber *number = [self numberForGetterName:getterName];
  return [number unsignedLongLongValue];
}

- (double)handleDoubleWithName:(NSString *)getterName
{
  NSNumber *number = [self numberForGetterName:getterName];
  return [number doubleValue];
}

- (long long)handleLongLongWithName:(NSString *)getterName
{
  NSNumber *number = [self numberForGetterName:getterName];
  return [number longLongValue];
}

- (char)handleCharWithName:(NSString *)getterName {
  NSNumber *number = [self numberForGetterName:getterName];
  return [number charValue];
}

- (BOOL)handleBOOLWithName:(NSString *)getterName
{
  NSNumber *number = [self numberForGetterName:getterName];
  return [number boolValue];
}

/** \param theSetter looks like: setParamName */
- (id)handleObjectGetterWithName:(NSString *)getterName
{
  NSString *value = [[self container] ds_jsonValueForKeyPath:[self keypathForGetter:getterName]];
  return value;
}

- (id)handleStringToNumberGetterWithName:(NSString *)getterName
{
  NSNumber *number = [self numberForGetterName:getterName];
  return number;
}

- (id)handleStringToDateGetterWithName:(NSString *)getterName
{
  id dateObject = [[self container] ds_jsonValueForKeyPath:[self keypathForGetter:getterName]];
  NSDate *date = nil;
  
  if ([dateObject isKindOfClass:[NSNumber class]]) {
    dateObject = [NSString stringWithFormat:@"%@", dateObject];
  }
  
  if ([dateObject isKindOfClass:[NSDate class]]) {
    date = dateObject;
  }
  else if ([dateObject isKindOfClass:[NSString class]]) {
    NSString *customDateFormat = [self dateFormatForGetter:getterName];
    
    if (customDateFormat) {
      NSDateFormatter *dateFormatter = [[self dateFormatters] objectForKey:customDateFormat];
      if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [dateFormatter setDateFormat:customDateFormat];
        [[self dateFormatters] setObject:dateFormatter forKey:customDateFormat];
      }
      date = [dateFormatter dateFromString:dateObject];
    }
    else {
      date = [NSDate dateWithTimeIntervalSince1970:[dateObject doubleValue]];
    }
  }

  return date;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
  NSMethodSignature *signature = [super methodSignatureForSelector:selector];
  
  if (!signature) {
    NSString *typeEncoding = [self typeForPropertyWithName:NSStringFromSelector(selector)];
    if (typeEncoding) {
      signature = [NSMethodSignature signatureWithObjCTypes:[[NSString stringWithFormat:@"%@@:@", typeEncoding]cStringUsingEncoding:NSUTF8StringEncoding]];
    }
  }
  
  return signature;
}

- (NSDictionary *)allValues
{
  NSMutableDictionary *values = [NSMutableDictionary dictionary];
  
  NSArray *properties = [[self class] rt_properties];
  for (RTProperty *property in properties) {
    SEL selector = NSSelectorFromString([property name]);
    NSInvocation *invocation
    = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
    [invocation setTarget:self];
    [invocation setSelector:selector];
    [self forwardInvocation:invocation];
    __unsafe_unretained id value;
    [invocation getReturnValue:&value];
    if (value != nil) {
      values[[property name]] = value;
    }
  }
  
  return values;
}

- (NSString *)dateFormatForGetter:(NSString *)getter
{
  return nil;
}

- (NSString *)keypathForGetter:(NSString *)getter
{
  return getter;
}

- (id)containerValueForKeyPath:(NSString *)keyPath
{
  return [[self container] ds_jsonValueForKeyPath:keyPath];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:[self container] forKey:DSKEYPATH(container)];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [self initWithContainer:[aDecoder decodeObjectForKey:DSKEYPATH(container)]];
  return self;
}

@end
