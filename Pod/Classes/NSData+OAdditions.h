
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Additions)
/// Return new NSData object with `theLength` maximum number of bytes
- (NSData *)truncatedDataToLength:(NSUInteger)theLength;

/// Return SHA256 hash from this data
- (nullable NSData *)SHA256;

/// Return hex string from this data
- (NSString *)dsi_hexString;

- (NSString *)deviceTokenString;
@end

NS_ASSUME_NONNULL_END
