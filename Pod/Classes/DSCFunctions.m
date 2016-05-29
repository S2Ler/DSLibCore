#import "DSCFunctions.h"
@import MachO;

#if TARGET_OS_IPHONE
BOOL isIPadIdiom(void)
{
  return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

BOOL isIPhoneIdiom(void)
{
  return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

#endif

NSString *DSApplicationDocumentDirectoryPath(void)
{
  NSArray *documentsDirectories
      = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
          NSUserDomainMask,
          YES);

  assert([documentsDirectories count] > 0);

  if ([documentsDirectories count] > 0) {
    return documentsDirectories[0];
  }
  else {
    return nil;
  }
}

NSURL *DSApplicationDocumentDirectoryURL(void)
{

  NSString *path = DSApplicationDocumentDirectoryPath();
  if (path) {
    return [NSURL fileURLWithPath:path];
  }
  else {
    return nil;
  }
}

NSUInteger DSNumberOfParamsInSelector(SEL theSelector)
{
  NSString *selector = NSStringFromSelector(theSelector);
  NSArray *selectorComponents = [selector componentsSeparatedByString:@":"];
  if ([selectorComponents count] == 0) {
    return 0;
  }
  else {
    return [selectorComponents count] - 1;
  }
}

DSFileSize getFreeDiskSpace(NSError **errorRef)
{
  DSFileSize totalSpace;
  DSFileSize totalFreeSpace = DSFileSizeUndefined;
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject]
                                                                                     error:errorRef];

  if (dictionary) {
    NSNumber *fileSystemSizeInBytes = dictionary[NSFileSystemSize];
    NSNumber *freeFileSystemSizeInBytes = dictionary[NSFileSystemFreeSize];
    totalSpace = [fileSystemSizeInBytes longLongValue];
    totalFreeSpace = [freeFileSystemSizeInBytes longLongValue];
    NSLog(@"Memory Capacity of %llu MiB with %llu MiB Free memory available.", ((totalSpace / 1024ll) / 1024ll), ((totalFreeSpace / 1024ll) / 1024ll));
  }
  else {
    NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [*errorRef domain], (long) [*errorRef code]);
  }

  return totalFreeSpace;
}

struct task_basic_info get_task_info(char **errorStringRef)
{
  struct task_basic_info info;
  mach_msg_type_number_t size = sizeof(info);
  kern_return_t kerr = task_info(mach_task_self(),
      TASK_BASIC_INFO,
      (task_info_t) &info,
      &size);
  if (kerr == KERN_SUCCESS ) {
    return info;
  }
  else {
    char *errorString = mach_error_string(kerr);
    NSLog(@"Error: %s", errorString);
    *errorStringRef = errorString;
    return info;
  }
}

float randomFloatInRange(float smallNumber, float bigNumber)
{
  float diff = bigNumber - smallNumber;
  return (((float) (arc4random() % ((unsigned) RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

NSString *DSNSStringFromClass(Class class)
{
  NSString *const fullClassName = NSStringFromClass(class);  
  NSString *const pathExtension = fullClassName.pathExtension;
  if (pathExtension.length > 0) {
    return pathExtension;
  }
  else {
    return fullClassName;
  }
}

BOOL isRunInExtension() {
  return [[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"];
}

bool fequal(float A, float B, float maxDiff)
{
  // Check if the numbers are really close -- needed
  // when comparing numbers near zero.
  float diff = fabsf(A - B);
  if (diff <= maxDiff)
    return true;
  
  A = fabsf(A);
  B = fabsf(B);
  float largest = (B > A) ? B : A;
  
  if (diff <= largest * FLT_EPSILON)
    return true;
  return false;
}

bool fequalzero(float a){
  return fequal(a, 0, 0.000001);
}
