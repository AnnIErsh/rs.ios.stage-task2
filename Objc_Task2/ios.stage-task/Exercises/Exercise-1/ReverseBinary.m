#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 bit = 0;
    UInt8 res = 0;
    for (int i = 0; i < 8; i++)
    {
        bit = (n >> i) & 1;
        res = (res << 1) | bit;
    }
    return res;
}
