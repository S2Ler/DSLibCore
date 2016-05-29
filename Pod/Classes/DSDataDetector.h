
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface DSDataDetector : NSObject
/** Tries to find url in string and return if founded */
+ (nullable NSString *)urlFromString:(NSString *)string;
+ (nullable NSArray<NSURL*> *)urlsFromString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
