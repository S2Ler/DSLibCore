

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/** If you add new setting value, synthesize them like @synthesize <PROPERTY_NAME>;
 as @synthesize <PROPERTY_NAME> = _<PROPERTY_NAME> syntax is used for internal
 purposes */
@interface DSSettings_impl: NSObject
/** You can overwrite this method to use your own settings prefix.
 * Default implementation uses the class name */
- (nonnull NSString *)settingsPrefix;

- (void)setObject:(id)object forKey:(NSString *)key;
- (nullable id)objectForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
