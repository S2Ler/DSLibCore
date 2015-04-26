#pragma mark - include
#import "DSQueue.h"

#pragma mark - props
@interface DSQueue()
{
  /** Maximum number of objects in queue */
  NSUInteger capacity_;
  
  /** Indicates whether capacity == count */
  BOOL isFull_;
}

@property (nonatomic, copy) NSMutableArray *queue;
@end


@implementation DSQueue
#pragma mark - synth
@synthesize isFull = isFull_;
@synthesize queue = queue_;

#pragma mark - inits
- (id)initWithCapacity:(NSUInteger)theCapacity {
	self = [super init];
	if (self != nil) {
		queue_ = [[NSMutableArray alloc] initWithCapacity:theCapacity];
    capacity_ = theCapacity;
    isFull_ = NO;
	}
	return self;
}

- (id)init {
  self = [super init];
  if (self) {
    queue_ = [[NSMutableArray alloc] init];
    capacity_ = NSUIntegerMax;
    isFull_ = NO;
  }
  return self;
}

+ (DSQueue *)queue
{
  return [[DSQueue alloc] init];
}


#pragma mark ----------------queue----------------
- (id)pop
{
  id lastObject = [queue_ lastObject];
  if (lastObject != nil) {
    [queue_ removeLastObject];
	}
  [self updatedIsFullVariable];

  return lastObject;
}

- (id)top {
  return [queue_ lastObject];
}

- (id)first {
  if ([queue_ count] > 0) {
    return [queue_ objectAtIndex:0];
  } else {
    return nil;
  }
}

- (void)push:(id)anObject
{
  if (!anObject) {
    return;
  }
  
  if ([queue_ count] == capacity_) {
    [queue_ removeObjectAtIndex:0];
    [self updatedIsFullVariable];
  }
	[queue_ addObject:anObject];
  [self updatedIsFullVariable];
}

- (void)pushBack:(id)theObject
{
  if (!theObject) {
    return;
  }
  
  if ([queue_ count] == capacity_) {
    [queue_ removeObjectAtIndex:0];
    [self updatedIsFullVariable];
  }
  
	[queue_ insertObject:theObject
               atIndex:0];
  [self updatedIsFullVariable];  
}

- (void)pushObjectsFromArray:(NSArray *)array
{
  [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self push:obj];
  }];
}

- (void)removeAll {
	[queue_ removeAllObjects];
  [self updatedIsFullVariable];
}

- (void)removeObjectsInArray:(NSArray *)theObjects
{
  [queue_ removeObjectsInArray:theObjects];
}

- (BOOL)containsObject:(id)anObject
{
  return [[self queue] containsObject:anObject];
}


- (NSUInteger)count {
	return [queue_ count];
}

- (NSUInteger)capacity {
  return capacity_;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:queue_
                forKey:@"queue"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {	
	queue_ = [aDecoder decodeObjectForKey:@"queue"];
	return self;
}

- (NSEnumerator *)objectEnumerator {
  return [queue_ objectEnumerator];
}

- (NSEnumerator *)reverseObjectEnumerator {
  return [queue_ reverseObjectEnumerator];
}

- (id)firstObjectWhichEqualsTo:(id)object
{
  NSUInteger idx = [[self queue] indexOfObject:object];
  if (idx != NSNotFound) {
    return [[self queue] objectAtIndex:idx];
  }
  else {
    return nil;
  }
}


/** Update the state of the isFull_ variable */
- (void)updatedIsFullVariable {
  [self setIsFull:([self count] >= [self capacity])];
}

- (id)copyWithZone:(NSZone *)zone
{
  DSQueue *copy = [[[self class] allocWithZone:zone] initWithCapacity:capacity_];
  [copy setQueue:queue_];
  return copy;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
  return [queue_ countByEnumeratingWithState:state objects:buffer count:len];
}

- (void)filterWithPredicate:(NSPredicate *)predicate
{
  [[self queue] filterUsingPredicate:predicate];
}

- (NSArray *)array
{
  return [[self queue] copy];
}
@end
