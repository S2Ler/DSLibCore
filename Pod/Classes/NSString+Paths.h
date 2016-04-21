
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Paths)
- (NSString *)stringByReplacingExtensionWith:(NSString *)newExtension;
- (BOOL)isExtensionEqualTo:(NSString *)extension;
@end

NS_ASSUME_NONNULL_END
