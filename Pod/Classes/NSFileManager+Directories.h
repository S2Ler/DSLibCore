@import Foundation;

NS_ASSUME_NONNULL_BEGIN
/** Easy access various directories */
@interface NSFileManager (NSFileManager_Directories)

/**
 \param theType the type of the directory to return
 \return path for the directory with NSUserDomainMask of type theType */
+ (nullable NSString *)userDirectoryOfType:(NSSearchPathDirectory)theType;
@end

NS_ASSUME_NONNULL_END
