
@import Foundation;

#import "DSConstants.h"

#define isPhone568 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 568)
/** Don't append extension */
#define iPhone568ImagePNGNamed(image) (isPhone568 ? [NSString stringWithFormat:@"%@-568h", image] : image)
#define iPhone568ImageNamed(image) (isPhone568 ? [NSString stringWithFormat:@"%@-568h.%@", [image stringByDeletingPathExtension], [image pathExtension]] : image)
#define iPhone568ImagePNG(image) ([UIImage imageNamed:iPhone568ImagePNGNamed(image)])
#define iPhone568Image(image) ([UIImage imageNamed:iPhone568ImageNamed(image)])


extern NSString *const EMAIL_REGEX;

@interface NSString(Extras)

- (BOOL) isEmpty;
- (BOOL) hasValue;

+ (BOOL)validateString:(NSString *)theString 
								 regex:(NSString *)theRegex;

+ (BOOL)availableStringPointer:(NSString*)theString;
// return a new autoreleased UUID string
+ (NSString *)generateUuidString;

- (NSString *)stringByLeavingOnlyNumbers;

- (BOOL)containsString:(NSString *)theString;

- (BOOL)beginsWithString:(NSString *)theString;
- (unichar)lastChar;
- (unichar)firstChar;
- (NSString *)stringForPhoneNumber;
- (NSString *)stringWithFirstCharUpperCase;

/** \important!!! theLeftDivider shouldn't be equal to theRightDivider */
- (NSString *)stringBetweenString:(NSString *)theLeftDivider
                        andString:(NSString *)theRightDivider;

//Validation
- (BOOL)validateWithRegex:(NSString *)theRegex;
+ (NSPredicate *)predicateWithRegex:(NSString *)regex;
- (BOOL)validateEmail;
- (NSString *)stringByRemovingNFirstChars:(NSUInteger)theN;
- (NSString *)stringByRemovingPrefix:(NSString *)thePrefixName;

+ (NSString *)stringWithComponents:(NSArray *)components concatenatedBy:(NSString *)separator;

/** Return yes if self string path extension is on of the pathExtensions extensions. */
- (BOOL)isPathExtensionEqualToOneOf:(NSArray *)pathExtensions;

/** \param setter looks like: setParamName */
+ (NSString *)propertyNameFromSetter:(SEL)setter;

- (NSString *)perlSearchRegex;

- (NSString *)truncateToLength:(NSUInteger)lenght;


/** Determine whether target string contains only ANSI chars. */
- (BOOL)isANSI;

/** Make a MD5 hash from the target string
 \return MD5 hash of the target string */
- (NSString *)MD5Hash;

/** Creates a string from the bytes in form:
 100 bytes 10 KB, 20 MB, 30 GB, 40 TB, 50 PB */
+ (NSString *)sizePrettyStringWithBytes:(DSFileSize)theSizeInBytes;
+ (NSString *)sizePrettyString1000NominationWithBytes:(DSFileSize)theSizeInBytes;

/** Apply NSLocalizedString to the target string */
- (NSString *)localized;

/** Return image from the app Bundle with name of the target string taking into account 4' screen size.
 * Files naming convention:
 * Non-Retina: image.[ext]
 * Retina: image@2x.[ext]
 * 4' Retina: image-568h@2x.[ext]
 * */
- (UIImage *)image;

- (NSDictionary *)loadPlistFromBundle;

- (NSString *)trimWhiteSpaces;

- (NSString *)urlCompliantString;

+ (NSString *)generateUUIDString;
@end
