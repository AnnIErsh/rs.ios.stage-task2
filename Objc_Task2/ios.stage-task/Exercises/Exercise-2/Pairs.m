#import "Pairs.h"

@implementation Pairs

- (NSInteger)makeDifference:(NSArray <NSNumber *> *)array withNumber:(NSInteger)numb andSize:(NSInteger)size atPosition:(int)index {
    NSInteger count = 0;
    NSInteger diff = 0;
    for (int i = index + 1; i < size; i++)
    {
        diff = [array[index] intValue] - [array[i] intValue];
        (diff == numb) || (diff * (-1) == numb) ? count++ : count;
    }
    return count;
}

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger size = array.count;
    NSInteger pairCount = 0;
    if (!array || [array isEqualToArray:@[]] || size < 2)
        return 0;
    NSArray *arr = [array sortedArrayUsingSelector:@selector(compare:)];
    for (int i = 0; i < size; i++)
        pairCount += [self makeDifference:arr withNumber:number.intValue andSize:size atPosition:i];
    return pairCount;
}

@end
