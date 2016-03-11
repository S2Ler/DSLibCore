#import "NSString+Extras.h"
#import <CommonCrypto/CommonDigest.h>

NSString *const EMAIL_REGEX = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

@implementation NSString(Extras)

- (BOOL) isEmpty
{
	return ([[self stringByTrimmingCharactersInSet:
						[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0);
}

- (BOOL)hasValue
{
  return ![self isEmpty];
}

+ (BOOL)validateString:(NSString *)theString 
								 regex:(NSString *)theRegex
{
	NSPredicate *predicate =
	[NSPredicate predicateWithFormat:@"SELF MATCHES %@", theRegex];
	return [predicate evaluateWithObject:theString];
}

+ (BOOL)availableStringPointer:(NSString*)theString
{
	if(theString == nil)
		return NO;
	return YES;
}

+ (NSString *)generateUuidString
{
  CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
  
  NSString *uuidString
    = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
  CFRelease(uuid);
  
  return uuidString;
}

- (NSString *)stringByLeavingOnlyNumbers
{
  unichar *chars = malloc(sizeof(unichar)*[self length]);
  NSUInteger charsIdx = 0;
  
  for (NSUInteger idx = 0; idx < [self length]; idx++) {
    unichar c = [self characterAtIndex:idx];
    if (c == '1' ||
        c == '2' ||
        c == '3' ||
        c == '4' ||
        c == '5' ||
        c == '6' ||
        c == '7' ||
        c == '8' ||
        c == '9' ||
        c == '0') 
    {
      chars[charsIdx++] = c;      
    }
  }
  
  
  NSString *output = nil;
  if (charsIdx > 0) {
    output = [NSString stringWithCharacters:chars
                                     length:charsIdx];
  }
  free(chars);
  return output;
}

- (NSString *)stringWithFirstCharUpperCase
{
  NSString *capitalisedSentence = [self stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                withString:[[self  substringToIndex:1] capitalizedString]];
  return capitalisedSentence;  
}

- (BOOL)containsString:(NSString *)theString
{
  if (theString == nil) return NO;
  
  BOOL constrains = [self rangeOfString:theString].location != NSNotFound;
  return constrains;
}

- (BOOL)validateWithRegex:(NSString *)theRegex
{
  
	return [[NSString predicateWithRegex:theRegex] evaluateWithObject:self];
}

+ (NSPredicate *)predicateWithRegex:(NSString *)regex
{
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
  return predicate;
}

- (BOOL)validateEmail
{
  NSString *emailRegex = EMAIL_REGEX;
  
  BOOL validated = [self validateWithRegex:emailRegex];
  
  return validated;
}

- (NSString *)stringByRemovingNFirstChars:(NSUInteger)theN
{
  NSUInteger stringLength = [self length];
  if (stringLength <= theN) {
    return @"";
  }
  else if (theN == 0) {
    return [self copy];
  }
  
  NSRange rangeToRemove = NSMakeRange(0, theN);
  return [self stringByReplacingCharactersInRange:rangeToRemove
                                       withString:@""];
}

- (NSString *)stringByRemovingPrefix:(NSString *)thePrefixName
{
  if ([self hasPrefix:thePrefixName]) {
    return [self stringByRemovingNFirstChars:[thePrefixName length]];
  }
  else {
    return [self copy];
  }
}

+ (NSString *)stringWithComponents:(NSArray *)components concatenatedBy:(NSString *)separator
{
  return [components componentsJoinedByString:separator];
}

- (BOOL)isPathExtensionEqualToOneOf:(NSArray *)pathExtensions
{
  NSString *selfExtension = [self pathExtension];
  for (NSString *extension in pathExtensions) {
    if ([[extension lowercaseString] isEqualToString:[selfExtension lowercaseString]]) {
      return YES;
    }
  }

  return NO;
}

+ (NSString *)propertyNameFromSetter:(SEL)setter
{
  NSMutableString *propertyName = [[NSStringFromSelector(setter) stringByRemovingPrefix:@"set"] mutableCopy];
  [propertyName replaceCharactersInRange:NSMakeRange(0, 1)
                              withString:[[propertyName substringToIndex:1] lowercaseString]];
  [propertyName deleteCharactersInRange:NSMakeRange([propertyName length] - 1, 1)];
  return propertyName;
}


- (BOOL)beginsWithString:(NSString *)theString
{
  if (theString == nil) {
    return NO;
  }
  
  if ([theString isEqualToString:@""]) {
    return YES;
  }
  
  return [self hasPrefix:theString];
}


- (NSString *)stringBetweenString:(NSString *)theLeftDivider
                        andString:(NSString *)theRightDivider
{
  NSRange leftDividerRange;
  NSRange rightDividerRange;
  
  if (theLeftDivider == nil || [theLeftDivider isEmpty] == YES) {
    leftDividerRange.location = 0;
    leftDividerRange.length = 0;
  }
  else  {
    leftDividerRange = [self rangeOfString:theLeftDivider];
    if (leftDividerRange.location == NSNotFound) {
      return nil;
    }
  }
  
  if (theRightDivider == nil || [theRightDivider isEmpty] == YES) {
    rightDividerRange.location = [self length];
    rightDividerRange.length = 0;
  }
  else {
    rightDividerRange = [self rangeOfString:theRightDivider];
    if (rightDividerRange.location == NSNotFound) {
      return nil;
    }
  }
  
  NSUInteger leftDivider = NSMaxRange(leftDividerRange);
  NSUInteger rightDivider = rightDividerRange.location;
  
  if (rightDivider < leftDivider) return nil;
  
  NSRange returnStringRange = NSMakeRange(leftDivider,
                                          rightDivider - leftDivider);
  
  NSString *returnString = [self substringWithRange:returnStringRange];
  return returnString;
}

- (unichar)lastChar
{
  if ([self isEmpty] == NO) {
    return [self characterAtIndex:[self length] - 1];
  }
  else {
    return 0;
  }
}

- (unichar)firstChar
{
  if ([self isEmpty] == NO) {
    return [self characterAtIndex:0];
  }
  else {
    return 0;
  }
}

- (NSString *)stringForPhoneNumber
{
  unichar *chars = malloc(sizeof(unichar)*[self length]);
  NSUInteger charsIdx = 0;
  
  for (NSUInteger idx = 0; idx < [self length]; idx++) {
    unichar c = [self characterAtIndex:idx];
    if (c == '1' ||
        c == '2' ||
        c == '3' ||
        c == '4' ||
        c == '5' ||
        c == '6' ||
        c == '7' ||
        c == '8' ||
        c == '9' ||
        c == '0' ||
        c == '+' ||
        c == ')' ||
        c == '(')
    {
      chars[charsIdx++] = c;
    }
  }
  
  NSString *output = nil;
  if (charsIdx > 0) {
    output = [NSString stringWithCharacters:chars
                                     length:charsIdx];
  }
  free(chars);
  return output;
}

- (NSString *)perlSearchRegex
{
  NSMutableString *searchRegex = [NSMutableString string];
  [[[[self lowercaseString] trimWhiteSpaces] componentsSeparatedByString:@" "] enumerateObjectsUsingBlock:
   ^(NSString *keyword, NSUInteger idx, BOOL *stop) {
     [searchRegex appendFormat:@"(?=.*%@)", keyword];
   }];
  return searchRegex;
}

- (NSString *)truncateToLength:(NSUInteger)length
{
  if ([self length] <= length) {
    return [self copy];
  }
  else {
    if (length >= 3) {
      NSString *substring = [self substringToIndex:MAX(length - 3, 0)];
      NSString *truncated = [NSString stringWithFormat:@"%@...", substring];
      return truncated;
    }
    else {
      NSString *substring = [self substringToIndex:MAX(length, 0)];
      return substring;
    }
  }
}

- (BOOL)isANSI {
  NSUInteger charCount = [self length];
  
  for (NSUInteger i = 0; i < charCount; i++) {
    unichar c = [self characterAtIndex:i];
    
    if (c > 127) return NO;
  }
  
  return YES;
}

- (NSString *)MD5Hash {
  const char *str = [self UTF8String];
  unsigned char r[CC_MD5_DIGEST_LENGTH];
  CC_MD5(str, (CC_LONG)strlen(str), r);
  NSString *MD5Hash =
  [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
   r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
  return MD5Hash;
}

+ (NSNumberFormatter *)sizeFormatter {
  static NSNumberFormatter *formatter = nil;
  
  if (!formatter) {
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setPositiveFormat:@"#.#"];
    
  }
  
  return formatter;
}

+ (NSString *)sizePrettyStringWithBytes:(DSFileSize)theSizeInBytes
{
  return [self sizePrettyStringWithBytes:theSizeInBytes divider:1024];
}

+ (NSString *)sizePrettyString1000NominationWithBytes:(DSFileSize)theSizeInBytes
{
  return [self sizePrettyStringWithBytes:theSizeInBytes divider:1000];
}

+ (NSString *)sizePrettyStringWithBytes:(DSFileSize)theSizeInBytes divider:(float)divider
{
  NSString* sizeUnit = @"bytes";
  
  long double size = theSizeInBytes;
  
  if (size >= divider)
  {
    size /= divider;
    sizeUnit = @"KB";
  }
  if (size >= divider)
  {
    size /= divider;
    sizeUnit = @"MB";
  }
  if (size >= divider)
  {
    size /= divider;
    sizeUnit = @"GB";
  }
  if (size >= divider) {
    size /= divider;
    sizeUnit = @"TB";
  }
  if (size >= divider) {
    size /= divider;
    sizeUnit = @"PB";
  }
  
  NSString *prettyString
  = [NSString stringWithFormat:@"%@ %@",
     [[self sizeFormatter] stringFromNumber:
      [NSNumber numberWithFloat:size]],
     sizeUnit];
  
  return prettyString;
}

- (NSString *)localized {
  return NSLocalizedString(self, nil);
}

- (UIImage *)image {
  UIImage *image = nil;
  if (![[self pathExtension] isEmpty]) {
    image = iPhone568Image(self);
  }
  else {
    image = iPhone568ImagePNG(self);
  }
  
  if (!image) {
    image = [UIImage imageNamed:self];
  }
  
  return image;
}

- (NSDictionary *)loadPlistFromBundle
{
    return [self loadPlistFromBundle:nil];
}

- (NSDictionary *__nullable)loadPlistFromBundle:(nullable NSBundle *)bundle
{
    if (bundle == nil) {
        bundle == [NSBundle mainBundle];
    }
    
    NSString *plistPath = [bundle pathForResource:self ofType:@"plist"];
    if (plistPath) {
        NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
        return plist;
    } else {
        return nil;
    }
}

- (NSString *)trimWhiteSpaces
{
  return [self stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)urlCompliantString;
{
  NSString *s
  = (__bridge_transfer id)CFURLCreateStringByAddingPercentEscapes
  (
   NULL,
   (__bridge CFStringRef)[self mutableCopy],
   NULL,
   CFSTR("￼=,!$&'()*+;@?\n\"<>#\t :/"),
   kCFStringEncodingUTF8
   );
  
  return s;
}

+ (NSString *)generateUUIDString
{
  CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
  
  NSString *uuidString
  = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
  
  CFRelease(uuid);
  
  return uuidString;
}

- (NSString *)nameAbbreviation
{
  NSMutableString *abbreviation = [NSMutableString new];
  
  [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                              options:NSStringEnumerationByWords | NSStringEnumerationLocalized
                           usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                             unichar component = [substring.uppercaseString firstChar];
                             [abbreviation appendString:[NSString stringWithCharacters:&component length:1]];
                           }];
  return abbreviation.copy;
}
@end
