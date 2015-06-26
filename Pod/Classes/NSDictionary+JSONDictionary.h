
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JSONDictionary)
- (nullable NSString *)stringValueForKey:(NSString *)key;
- (nullable NSNumber *)numberValueForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
