#import "Pairs.h"

@implementation Pairs

- (NSInteger)makeDifference:(NSMutableArray <NSNumber *> *)array withNumber:(NSInteger)n andCounter:(NSUInteger)count{
    size_t size = array.count - 1;
    if (size)
    {
        for (int i = 0; i < size + 1; i++)
        {
            if ([array[size] intValue] - [array[size - i] intValue] == n)
                count++;
        }
        [array removeLastObject];
        return [self makeDifference:array withNumber:n andCounter:count];
    }
    return count;
}

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSArray *arr = [array sortedArrayUsingSelector:@selector(compare:)];
    NSUInteger pairsCount = [self makeDifference:arr.mutableCopy withNumber:number.intValue andCounter:0];
    return pairsCount;
}
@end
