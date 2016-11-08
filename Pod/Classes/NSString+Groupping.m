
#import "NSString+Groupping.h"

@implementation NSString (Groupping)
- (NSString *)stringGroupByFirstInitial {
  NSString *uppercased = [self uppercaseString];
  
  if (uppercased.length <= 1) {
    return uppercased;
  }

  return [uppercased substringToIndex:1];
}
@end
