
@import Foundation;
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface DSRuntimeHacker : NSObject

- (instancetype)initWithClient:(id)clientObject;
+ (instancetype)hackerWithClient:(id)client;
- (nullable NSString *)propertyName:(id)property;
- (NSArray *)allProperties;
- (NSArray *)allPropertyNames;
/** Doesn't include superclasses of propertyClass.
 \important if objects properties have constant strings and you try to get them with
 propertyClass == NSString you will fail. TODO: Find workaround
 */
- (NSArray *)allPropertiesOfClass:(Class)propertyClass;
- (NSArray *)allPropertiesOfClass:(Class)propertyClass
              includeSuperclasses:(BOOL)includeSuperclasses;

- (NSString *)classNameForObject:(id)object;

/** Only properties like NSNumber *name; NSArray *name; and so on are supported */
- (nullable Class)classForProperty:(objc_property_t)theProperty;
@end

NS_ASSUME_NONNULL_END
