@import Foundation;

/** First In First Out queue.
 If number of items exceed theCapacity defined in initWithCapacity: method the object which
 came first will be removed.
 If you use init: method the capacity will be NSUIntegerMax.
 */
@interface DSQueue : NSObject
<
NSCoding,
NSCopying,
NSFastEnumeration
> 

/** \param theCapacity maximum number of items in queue */
- (id __nonnull)initWithCapacity:(NSUInteger)theCapacity NS_DESIGNATED_INITIALIZER;
- (id __nonnull)init NS_DESIGNATED_INITIALIZER;
- (id __nonnull)initWithCoder:(NSCoder *__nonnull)aDecoder NS_DESIGNATED_INITIALIZER;
+ (DSQueue *__nonnull)queue;

/** \return Poped object from the queue. The one which pushed last. */
- (id __nullable)pop;

/** Adds theObject to the end of queue. 
 @param theObject nil values ignored
 */
- (void)push:(id __nullable)theObject;
/** Adds theObject to the beginning of the queue */
- (void)pushBack:(id __nullable)theObject;

- (void)pushObjectsFromArray:(NSArray *__nullable)array;

/** The top object in the queue */
- (id __nullable)top;

/** The first object in queue */
- (id __nullable)first;

/** Remove all objects from the queue */
- (void)removeAll;

/** Remove specific objects from queue */
- (void)removeObjectsInArray:(NSArray *__nullable)theObjects;

- (BOOL)containsObject:(id __nullable)anObject;

/** \return current number of objects in the queue */
- (NSUInteger)count;

/** \return maximum number of objects in the queue */
- (NSUInteger)capacity;

/** \return YES if capacity == count. 
 \note KVO is supported by this method */
- (BOOL)isFull;

/** \return enumerator for all objects in queue */
- (NSEnumerator *__nonnull)objectEnumerator;

/** \return reversed enumerator for all objects in queue */
- (NSEnumerator *__nonnull)reverseObjectEnumerator;

- (id __nullable)firstObjectWhichEqualsTo:(id __nonnull)object;

- (void)filterWithPredicate:(NSPredicate *__nonnull)predicate;

- (NSArray *__nonnull)array;
@end

/** For internal and subclass use */
@interface DSQueue()
@property (assign) BOOL isFull;
@end
