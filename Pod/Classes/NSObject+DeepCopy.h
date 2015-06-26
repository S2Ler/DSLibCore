
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeepCopy)
/** Checks for NSCoding conformance and return nil if receiver doesn't conform. */
- (nullable instancetype)deepCopy;
@end

NS_ASSUME_NONNULL_END
