#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (!numbersArray || [numbersArray isEqualToArray:@[]])
        return @"";
    NSMutableArray *arr = [NSMutableArray array];
    size_t n = numbersArray.count;
    n > 4 ? n = 4 : n;
    for (int i = 0; i < n; i++)
    {
        if ([numbersArray[i] intValue] < 0)
            return @"Negative numbers are not valid for input.";
        if ([numbersArray[i] intValue] > 255)
            return @"The numbers in the input array can be in the range from 0 to 255.";
        [arr addObject:numbersArray[i]];
    }
    NSMutableString *str = [arr componentsJoinedByString:@"."].mutableCopy;
    if (n < 4)
    {
        for (int i = 0; i < 4 - n; i++)
            [str appendString:@".0"];
    }
    return str;
}

@end
