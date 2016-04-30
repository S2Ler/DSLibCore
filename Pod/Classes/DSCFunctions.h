
@import Foundation;
#import "DSConstants.h"
#pragma mark - macros


#if TARGET_OS_IPHONE
/// Return if current device has iPad idiom
BOOL isIPadIdiom(void);
/// Return if current device has iPhone idiom
BOOL isIPhoneIdiom(void);
#endif


#pragma mark - paths
/// Return path to this application Document directory
NSString *__nonnull DSApplicationDocumentDirectoryPath(void);
/// Return URL to this application Document directory
NSURL *__nonnull DSApplicationDocumentDirectoryURL(void);

/// Parse selector string and return how many parameters it has
NSUInteger DSNumberOfParamsInSelector(SEL __nonnull theSelector);

/// Return the amount of free space on the file system.
DSFileSize getFreeDiskSpace(NSError *__nullable * __nonnull errorRef);


struct task_basic_info get_task_info(char *__nullable *__nullable errorStringRef);

/// Return random float between `smallNumber` and `bigNumber`
float randomFloatInRange(float smallNumber, float bigNumber);

/** Returns class name string without module name (Swift) */
NSString *__nonnull DSNSStringFromClass(Class __nonnull class);

BOOL isRunInExtension();

bool fequal(float a, float b, float maxDiff);
bool fequalzero(float a);
