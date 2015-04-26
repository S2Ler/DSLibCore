
@import Foundation;
#import "DSConstants.h"
#pragma mark - macros




#if TARGET_OS_IPHONE
BOOL isIPadIdiom(void);
#endif


#pragma mark - paths
NSString *__nullable DSApplicationDocumentDirectoryPath(void);
NSURL *__nullable DSApplicationDocumentDirectoryURL(void);

NSUInteger DSNumberOfParamsInSelector(SEL __nonnull theSelector);

DSFileSize getFreeDiskSpace(NSError *__nullable * __nonnull errorRef);
struct task_basic_info get_task_info(char *__nullable *__nonnull errorStringRef);

float randomFloatInRange(float smallNumber, float bigNumber);

