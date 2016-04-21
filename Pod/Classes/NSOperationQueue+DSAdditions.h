
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSOperationQueue (DSAdditions)
- (void)addOperationWithClosure:(void (^)(NSBlockOperation *operation))block;
@end

NS_ASSUME_NONNULL_END
