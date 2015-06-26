#import "DSMacros.h"

BOOL iOS7orHigher(void) {
  return [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7;
}

BOOL iOS8orHigher(void) {
  return [[[UIDevice currentDevice] systemVersion] doubleValue] >= 8;
}
