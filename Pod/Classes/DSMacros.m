#import "DSMacros.h"

BOOL iOS7orHigher(void) {
  return [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7;
}

BOOL iOS8orHigher(void) {
  return [[[UIDevice currentDevice] systemVersion] doubleValue] >= 8;
}

BOOL isIPhone4Screen(void) {
  return [UIScreen mainScreen].bounds.size.height == 480 && [UIScreen mainScreen].bounds.size.width == 320;
}

BOOL isScreenSizeHigherThanIPhone4(void) {
  return ([[UIScreen mainScreen] preferredMode].size.height > 480 * [[UIScreen mainScreen] scale] && !isIPadIdiom());
}
