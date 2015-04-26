
@import Foundation;

#import "DSConstants.h"

#define isPhone568 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
/** Don't append extension */
#define iPhone568ImagePNGNamed(image) (isPhone568 ? [NSString stringWithFormat:@"%@-568h", image] : image)
#define iPhone568ImageNamed(image) (isPhone568 ? [NSString stringWithFormat:@"%@-568h.%@", [image stringByDeletingPathExtension], [image pathExtension]] : image)
#define iPhone568ImagePNG(image) ([UIImage imageNamed:iPhone568ImagePNGNamed(image)])
#define iPhone568Image(image) ([UIImage imageNamed:iPhone568ImageNamed(image)])


extern NSString *__nonnull const EMAIL_REGEX;

@interface NSString(Extras)

- (BOOL) isEmpty;
- (BOOL) hasValue;

+ (BOOL)validateString:(NSString *__nonnull)theString
								 regex:(NSString *__nonnull)theRegex;

+ (BOOL)availableStringPointer:(NSString *__nullable)theString;
// return a new autoreleased UUID string
+ (NSString *__nonnull)generateUuidString;

- (NSString *__nonnull)stringByLeavingOnlyNumbers;

- (BOOL)containsString:(NSString *__nullable)theString;

- (BOOL)beginsWithString:(NSString *__nullable)theString;
- (unichar)lastChar;
- (unichar)firstChar;
- (NSString *__nullable)stringForPhoneNumber;
- (NSString *__nonnull)stringWithFirstCharUpperCase;

/** \important!!! theLeftDivider shouldn't be equal to theRightDivider */
- (NSString *__nullable)stringBetweenString:(NSString *__nullable)theLeftDivider
                                  andString:(NSString *__nullable)theRightDivider;

//Validation
- (BOOL)validateWithRegex:(NSString *__nonnull)theRegex;
+ (NSPredicate *__nonnull)predicateWithRegex:(NSString *__nonnull)regex;
- (BOOL)validateEmail;
- (NSString *__nonnull)stringByRemovingNFirstChars:(NSUInteger)theN;
- (NSString *__nonnull)stringByRemovingPrefix:(NSString *__nullable)thePrefixName;

+ (NSString *__nonnull)stringWithComponents:(NSArray *__nonnull)components concatenatedBy:(NSString *__nullable)separator;

/** Return yes if self string path extension is on of the pathExtensions extensions. */
- (BOOL)isPathExtensionEqualToOneOf:(NSArray *__nullable)pathExtensions;

/** \param setter looks like: setParamName */
+ (NSString *__nonnull)propertyNameFromSetter:(SEL __nonnull)setter;

- (NSString *__nonnull)perlSearchRegex;

- (NSString *__nonnull)truncateToLength:(NSUInteger)lenght;


/** Determine whether target string contains only ANSI chars. */
- (BOOL)isANSI;

/** Make a MD5 hash from the target string
 \return MD5 hash of the target string */
- (NSString *__nonnull)MD5Hash;

/** Creates a string from the bytes in form:
 100 bytes 10 KB, 20 MB, 30 GB, 40 TB, 50 PB */
+ (NSString *__nonnull)sizePrettyStringWithBytes:(DSFileSize)theSizeInBytes;
+ (NSString *__nonnull)sizePrettyString1000NominationWithBytes:(DSFileSize)theSizeInBytes;

/** Apply NSLocalizedString to the target string */
- (NSString *__nonnull)localized;

/** Return image from the app Bundle with name of the target string taking into account 4' screen size.
 * Files naming convention:
 * Non-Retina: image.[ext]
 * Retina: image@2x.[ext]
 * 4' Retina: image-568h@2x.[ext]
 * */
- (UIImage *__nullable)image;

- (NSDictionary *__nullable)loadPlistFromBundle;

- (NSString *__nonnull)trimWhiteSpaces;

- (NSString *__nonnull)urlCompliantString;

+ (NSString *__nonnull)generateUUIDString;
@end
