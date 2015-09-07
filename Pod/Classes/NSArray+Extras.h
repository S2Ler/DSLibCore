
@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (Extras)

- (NSUInteger)indexForInsertingObject:(id)anObject
                     sortedUsingBlock:(NSInteger (^)(id a, id b))compare;

- (NSInteger)indexForEqualObject:(id)anObject
                 equalUsingBlock:(NSInteger (^)(id a, id b))compare;


- (nullable id)ds_objectAtIndex:(NSUInteger)index;

- (NSArray *)imagesArray;

/** @return array of arrays. Each array contains objects which has equal keyPath values */
- (NSArray *)groupObjectsByKeyPath:(NSString *)keyPath;

/** objects at keyPath should conform to NSCopying protocol */
- (NSDictionary *)mapObjectsByKeyPath:(NSString *)keyPath;
- (NSDictionary *)mapObjectsByKeyPath:(NSString *)keyPath
            sortedWithSortDescriptors:(nullable NSArray *)sortDescriptors;
- (NSUInteger)countObject:(id)object;

- (NSArray *)filteredArrayUsingBlock:(BOOL(^)(id evaluatedObject))block;

- (nullable ObjectType)randomObject;

- (NSArray *)map:(id(^)(id object))block;

- (void)ds_apply:(void (^)(id object))function;

@end

NSArray *mapFast(NSObject<NSFastEnumeration> *fastEnumerator, id(^block)(id));

NS_ASSUME_NONNULL_END
