---
title: "IEEE 754, Errors, and Algorithms"
date: 2025-07-18 12:00:00 +0900
categories: ["Numerical Methods"]
tags: ["floating-point", "stability", "ieee-754", "kahan-summation", "python"]
description: "Study note on floating-point representation, rounding errors, and stable summation, with Python examples."
status: "note"
note_type: "concept"
math: true
toc: true
permalink: "/posts/ieee754-errors-and-algorithms/"
projects: ["krylov-solvers"]
---

## 1. Motivation

Understand floating-point representation and rounding error, and compare the accuracy of summation algorithms.

### 1.1 IEEE 754 representation

IEEE 754 covers number formats, sign/exponent/fraction fields, rounding, overflow/underflow, NaN, and infinity handling.

$$
x = (-1)^s \times (1.f) \times 2^{e - \text{bias}}
$$

| Component | Role |
|-----------|------|
| Sign bit | 0 for positive values, 1 for negative values |
| Exponent | biased exponent |
| Mantissa | Fraction bits after the binary point |

### 1.2 Float vs Double

| Type | Total bits | Sign | Exponent | Mantissa | Bias |
|------|------------|------|----------|----------|------|
| float | 32 | 1 | 8 | 23 | 127 |
| double | 64 | 1 | 11 | 52 | 1023 |

[Correction required]

- Issue: The expression applies only to normal numbers but is presented as a representation of every IEEE 754 value. The text also fails to distinguish language type names float/double from IEEE formats.
- Why this matters: Subnormals, signed zero, infinity, and NaN require different interpretations of the implicit leading bit and exponent.
- Required revision: State the scope as binary32/binary64, then distinguish the normal exponent range, subnormal numbers, zero, and special values. Distinguish fraction bits from significand precision in the table.

## 2. Rounding Errors

### 2.1 Machine epsilon, relative error, absolute error

Let $fl(x)$ denote the value representing $x$ in the computer system.

$$
\epsilon_{relative} = \frac{|x - fl(x)|}{|x|},
\qquad
\epsilon_{absolute} = |x - fl(x)|.
$$

[Correction required]

- Issue: Relative error does not exclude $x=0$, and machine epsilon in the heading is undefined.
- Why this matters: Relative error is undefined when its denominator is zero. Failing to distinguish machine epsilon from unit roundoff changes constants in later error bounds.
- Required revision: State the roles of the exact and rounded values, require $x\ne0$, specify the rounding mode, and define the machine-epsilon/unit-roundoff convention.

### 2.2 Error types and exceptions

- truncation error: error caused by cutting off an infinite decimal expansion.
- rounding-off error: TODO
- overflow / underflow: TODO
- error magnification: TODO
- computation error: error arising in an algorithm or iteration.

[Correction required]

- Issue: Truncation error is restricted to cutting off decimal digits, and the distinction between computation error and rounding error is unclear.
- Why this matters: In numerical analysis, truncation error includes errors from approximating infinite processes or continuous problems. Mixing it with rounding in binary representation obscures the source of the error.
- Required revision: Distinguish approximation/truncation, representation/rounding, and error amplification due to conditioning. Complete the discussion of overflow and underflow.

#### Absorption

Original claim: if $|x-y|>2^{52}$ and $y$ is smaller, then $fl(x+y)=fl(x)$.

[Correction required]

- Issue: The text claims that $|x-y|>2^{52}$ alone causes the smaller term to disappear.
- Why this matters: Absorption depends on spacing near the larger number and the rounding mode, rather than a fixed threshold on the difference between the numbers.
- Required revision: Specify the signs and representability of $x,y$, and reformulate the condition using ulps and rounding intervals. Check a counterexample where the current inequality holds but the sum changes.

#### Loss of significance

Subtracting nearby numbers can cause loss of significance. The original two expressions are

$$
f_1(x)=\sqrt{x}(\sqrt{x+1}-\sqrt{x}),\qquad
f_2(x)=\frac{\sqrt{x}}{\sqrt{x+1}-\sqrt{x}}.
$$

The original text claims that these expressions are mathematically equal.

[Correction required]

- Issue: The two displayed formulas are not equal, and $f_2$ in the code below uses a plus sign in the denominator.
- Why this matters: The conjugate sign used for rationalization differs between the text and code, so they do not describe the same expressions for a stability comparison.
- Required revision: Correct the denominator sign by comparing the text with the code, and verify the admissible domain and the key intermediate rationalization step.

```python

import decimal
from decimal import Decimal
import math 

decimal.getcontext().prec = 50


f1 = lambda x : Decimal(x).sqrt()*((Decimal(x+1)).sqrt()-(Decimal(x)).sqrt())
f2 = lambda x : Decimal(x).sqrt()/((Decimal(x+1)).sqrt()+(Decimal(x)).sqrt())


for i in range(0,54):
    print(f"at {pow(10,i):d}, \t f1(x) = {f1(pow(10,i))} \t f2(x) = {f2(pow(10,i))}")


```

``` python
# output at 
at 100000000000000000000000000000000000000000000000000000,      f1(x) = 0E-46   f2(x) = 0.5
```

[Suggested addition]

- Limitation of the current explanation: The 50-digit Decimal experiment could be read as a direct IEEE binary64 experiment, and the cause of cancellation is not explained.
- Suggested addition: Distinguish Decimal precision from binary64 precision, and identify where rounding errors in the square roots become relatively large after subtraction.
- Reason: Reconstructing the meaning of the experiment requires distinguishing evaluation order from the arithmetic model, even for the same algebraic expression.

### 2.3 Non-associativity

Rounding makes floating-point addition nonassociative.

```python

# Example in Python
a = 1e20
b = -1e20
c = 3.14

print((a + b) + c)  # prints 3.14
print(a + (b + c))  # prints 0.0
```

## 3. Precision Algorithms

### Kahan Two Sum

Original error claim: summing $n$ terms guarantees $O(n\epsilon)$.

[Correction required]

- Issue: The heading confuses TwoSum with Kahan compensated summation. The function below has invalid Python type annotations and no return statement. The claim $O(n\epsilon)$ does not identify the error being bounded.
- Why this matters: The two algorithms have different purposes and outputs, and the current code cannot run. Accuracy claims cannot be compared without absolute/relative error definitions and summation conditioning.
- Required revision: Check the algorithm name and output contract, and correct the annotations and return statement. Compare the error statement with the source, including rounding assumptions, unit roundoff, input magnitudes, and cancellation.

```python

def KahanTwoSum(x:[list:float]):
  c = 0.0 # current error 
  t = 0.0 # global sum 
  for x_ele in x:
    y = x_ele - c
    total = t + y # an error might exists + e1 
    c = (total - t) - y
    t = total 
```

### Neumaier (1974)

This draft aims to improve on Kahan summation. The original error claim is $O(n\epsilon)$.

[Correction required]

- Issue: The magnitude comparison uses total instead of the partial sum $t$, and the correction in the first branch subtracts $x\_ele$. The type annotations are also invalid Python syntax.
- Why this matters: The correction fails to recover the term lost to rounding and may corrupt even an exact sum.
- Required revision: Compare the formula with Neumaier's original magnitude condition and correction signs. Test both branches, severe cancellation, and exactly representable small-integer sums, and specify the norm, scale, and assumptions of the error claim.

```python 

def Neumaier(x:[list:float]):
  c = 0.0
  t = 0.0
  for x_ele in x:
    total = t + x_ele # f(t + x_ele) = t + x_ele + $\epsilon$
    if abs(total) >= abs(x_ele):
      c += (t - total) - x_ele  
    else:
      c += (x_ele - total) + t
    t = total
  return t + c
```

### Superaccumulator

[Correction required]

- Issue: Subnormal bit weights are shifted by one position, and the default bin exponent range truncates the lower binary64 positions. Infinity is returned immediately without checking its sign or a later NaN.
- Why this matters: Information from finite inputs is lost, and sums involving special values may also be incorrect. Floating-point counters and the final floating-point summation do not guarantee exact accumulation or correct final rounding either.
- Required revision: Verify the bit-to-exponent mapping for normal and subnormal numbers and the full exponent range required. Design integer accumulation, carry propagation, final rounding, the ±infinity/NaN policy, and the return contract, then check boundary values.

```python



import struct

def float_to_bits(x:float):
    
    bits = struct.unpack('>Q', struct.pack('>d',x))[0]
    signed_bit = ((bits >> 63) & 1)
    exponent = ((bits >>52) & (0x7FF) )
    mantissa = (bits & ( (1<<52) -1))
    return signed_bit, exponent, mantissa

def superacc(x_list:list[float], bins = 2048):

    acc_neg = [0.0] * bins
    acc_pos = [0.0] * bins
    offset = bins//2
    bias = 1023

    for x in x_list:
        sign_bit, expo, mantissa = float_to_bits(x)

        if expo  == 2047:
            if mantissa == 0:
                return float('inf')
            else:
                return float('nan')


        if expo == 0: #subnormal
            precision = 52
            man = mantissa
            e = 1 - bias
        # this place for NaN and Infty
        else: # normal
            precision = 53
            e = expo - bias
            man = (1<< 52) | mantissa

        for i in range(precision):
            idx = e + offset - i
            if (( man >> (precision-i-1)) & 1) == 1:
                if 0 <= idx < bins:
                    if sign_bit == 0: # positive
                        acc_pos[idx] +=1
                    else:
                        acc_neg[idx] +=1

    # in this case, the exponents are already aligned,
    # so normalization is not required.

    result = 0.0
    for i in range(bins):
        num = acc_pos[i] - acc_neg[i]
        e = i - offset
        result += (num)*2**(e)
        
    print(result)

    
```

## Review references

- [Goldberg, What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html): review of representation, rounding, cancellation, and compensated summation.
- [Ogita–Rump–Oishi, Accurate Sum and Dot Product](https://www.tuhh.de/ti3/paper/rump/OgRuOi05.pdf): review of the distinction between TwoSum, error-free transformations, and summation error.
