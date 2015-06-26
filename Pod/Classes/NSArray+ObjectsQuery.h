
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/** A set of usefull functions to query object from NSArray */
@interface NSArray(ObjectsQuery) 

/** Get specific number of items from array.
 Makes checks for valid range and return nil if invalid.
 \param theFrom the index of the first object to query
 \param theCount number of items including theFrom to add to the query
 \return array with objects from the target array */
- (nullable NSArray *)objectsFromIndex:(NSUInteger)theFrom
                                 count:(NSUInteger)theCount;

- (nullable id)firstObjectWhichEqualsTo:(id)object;

/** if keypaths count is 1 returns an array of the keypath values from objects in the receiver array.
* if no keypaths return an empty array.
* if keypaths count is more than 1 return an array of dictionaries which contain keypath values from objects in the receiver array. Keypaths is a key in this dictionaries.
*/
- (NSArray *)extractKeypaths:(NSArray *)keypaths;
@end

NS_ASSUME_NONNULL_END

