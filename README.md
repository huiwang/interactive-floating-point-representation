Returns a representation of the specified floating-point value according to the IEEE 754 floating-point "single format" bit layout.

Bit 31 (the bit that is selected by the mask 0x80000000) represents the sign of the floating-point number.
Bits 30-23 (the bits that are selected by the mask 0x7f800000) represent the exponent.
Bits 22-0 (the bits that are selected by the mask 0x007fffff) represent the significand (sometimes called the mantissa) of the floating-point number.

If the argument is positive infinity, the result is 0x7f800000.
If the argument is negative infinity, the result is 0xff800000.
If the argument is NaN, the result is 0x7fc00000.

In all cases, the result is an integer that, when given to the intBitsToFloat(int) method, will produce a floating-point value the same as the argument to floatToIntBits (except all NaN values are collapsed to a single "canonical" NaN value).
