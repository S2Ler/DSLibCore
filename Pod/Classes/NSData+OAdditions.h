
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Additions)
- (NSData *)truncatedDataToLength:(NSUInteger)theLength;

- (nullable NSData *)SHA256;

- (NSString *)dsi_hexString;

- (NSString *)deviceTokenString;
@end

NS_ASSUME_NONNULL_END
