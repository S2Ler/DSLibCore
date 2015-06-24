
#import "NSOperationQueue+DSAdditions.h"

@implementation NSOperationQueue (DSAdditions)
- (void)addOperationWithClosure:(void (^)(NSBlockOperation *operation))block
{
  __block NSBlockOperation *operation = [[NSBlockOperation alloc] init];
  __weak NSBlockOperation *weakOperation = operation;
  [operation addExecutionBlock:^{
    block(weakOperation);
  }];
  
  [self addOperation:operation];
}
@end
