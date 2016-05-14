
#import "DSDataDetector.h"
#import "NSArray+Extras.h"
#import "DSRedirectLogs.h"

@implementation DSDataDetector
+ (NSString *)urlFromString:(NSString *)string
{
  NSArray<NSURL*> *urls = [self urlsFromString:string];
  return urls.firstObject.absoluteString;
}

+ (NSArray<NSURL*> *)urlsFromString:(NSString *)string {
  NSError *error = nil;
  NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeLink
                                                                 error:&error];
  if (!dataDetector) {
    DSRedirectLog(@"Failed to create data detector: %@", dataDetector);
    return nil;
  }
  
  NSArray<NSTextCheckingResult *> *matches = [dataDetector matchesInString:string
                                                                   options:(NSMatchingOptions)kNilOptions
                                                                     range:NSMakeRange(0, [string length])];
  if ([matches count] > 0) {
    return [matches flatMap:^id _Nonnull(NSTextCheckingResult * _Nonnull object) {
      return [object URL];
    }];
  }
  else {
    return nil;
  }
}
@end
