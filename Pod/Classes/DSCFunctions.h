
@import Foundation;
#import "DSConstants.h"
#pragma mark - macros


#if TARGET_OS_IPHONE
BOOL isIPadIdiom(void);
BOOL isIPhoneIdiom(void);
#endif


#pragma mark - paths
NSString *__nonnull DSApplicationDocumentDirectoryPath(void);
NSURL *__nonnull DSApplicationDocumentDirectoryURL(void);

NSUInteger DSNumberOfParamsInSelector(SEL __nonnull theSelector);

DSFileSize getFreeDiskSpace(NSError *__nullable * __nonnull errorRef);
struct task_basic_info get_task_info(char *__nullable *__nullable errorStringRef);

float randomFloatInRange(float smallNumber, float bigNumber);
/** Returns class name string without module name (Swift) */
NSString *__nonnull DSNSStringFromClass(Class __nonnull class);
