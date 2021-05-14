#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter


- (NSArray*)checkArray:(NSMutableArray*)arr andClass:(Class)myClass {
    NSMutableArray *results = [NSMutableArray array];
    for (id obj in arr)
    {
        if ([obj isKindOfClass:myClass])
            [results addObject:obj];
        else
            return @[];
    }
    return results;
}

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *arrOfNumbs = [NSMutableArray array];
    NSMutableArray *arrOfStrs = [NSMutableArray array];
    NSMutableArray *fullArr = [NSMutableArray array];
    for (id arr in array)
    {
        if ([arr isKindOfClass:[NSArray class]])
        {
            [arrOfNumbs addObjectsFromArray:[self checkArray:arr andClass:[NSNumber class]]];
            [arrOfStrs addObjectsFromArray:[self checkArray:arr andClass:[NSString class]]];
        }
        else
            return @[];
    }
    NSArray *numbs = [arrOfNumbs sortedArrayUsingSelector:@selector(compare:)];
    NSArray *strs = [arrOfStrs sortedArrayUsingSelector:@selector(compare:)];
    if (numbs.count && strs.count)
    {
        [fullArr addObject:numbs];
        [fullArr addObject:strs];
    }
    else
    {
        [fullArr addObjectsFromArray:numbs];
        [fullArr addObjectsFromArray:strs];
    }
    return fullArr;
}

@end
