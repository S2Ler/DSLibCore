
#import "NSString+Paths.h"
#import "NSString+Extras.h"

@implementation NSString (Paths)
- (NSString *)stringByReplacingExtensionWith:(NSString *)newExtension
{
  if (![self.pathExtension hasValue]) {
    return [self stringByAppendingPathExtension:newExtension];
  }
  else {
    NSRange oldExtensionRange = [self rangeOfString:self.pathExtension options:NSBackwardsSearch];
    return [self stringByReplacingCharactersInRange:oldExtensionRange withString:newExtension];
  }
}

- (BOOL)isExtensionEqualTo:(NSString *)extension
{
  return [[self pathExtension] isEqualToString:extension];
}
@end
