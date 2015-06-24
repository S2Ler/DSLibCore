
#import "NSString+Groupping.h"

@implementation NSString (Groupping)
- (NSString *)stringGroupByFirstInitial {
  NSString *temp = [self uppercaseString];
  
  if (!temp.length || temp.length == 1) {
    return self;
  }
  
  return [temp substringToIndex:1];
}
@end
