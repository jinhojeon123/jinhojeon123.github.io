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

Floating-point representation과 rounding error를 이해하고, summation algorithm의 정확성을 비교한다.

### 1.1 IEEE 754 representation

IEEE 754는 number format, sign / exponent / fraction, rounding, overflow / underflow, NaN과 infinity의 처리 규칙을 다룬다.

$$
x = (-1)^s \times (1.f) \times 2^{e - \text{bias}}
$$

| Component | 역할 |
|-----------|------|
| Sign bit | 양수는 0, 음수는 1 |
| Exponent | biased exponent |
| Mantissa | binary point 뒤의 fraction bits |

### 1.2 Float vs Double

| Type | Total bits | Sign | Exponent | Mantissa | Bias |
|------|------------|------|----------|----------|------|
| float | 32 | 1 | 8 | 23 | 127 |
| double | 64 | 1 | 11 | 52 | 1023 |

[수정 필요]

- 문제: 표현식이 normal number에만 해당하는데 모든 IEEE 754 값의 표현식처럼 제시되어 있다. float / double도 특정 언어의 type 이름과 IEEE format을 구분하지 않는다.
- 왜 문제인지: subnormal, signed zero, infinity, NaN은 implicit leading bit와 exponent 해석이 다르다.
- 어떻게 수정해야 하는지: binary32 / binary64를 다루는 범위를 명시하고, normal의 exponent 범위와 subnormal / zero / special value의 구분을 직접 정리할 것. 표의 fraction bits와 significand precision도 구분할 것.

## 2. Rounding Errors

### 2.1 Machine epsilon, relative error, absolute error

$fl(x)$를 computer system에서 나타낸 $x$의 값이라고 하자.

$$
\epsilon_{relative} = \frac{|x - fl(x)|}{|x|},
\qquad
\epsilon_{absolute} = |x - fl(x)|.
$$

[수정 필요]

- 문제: relative error에서 $x=0$이 제외되지 않았고, heading의 machine epsilon이 정의되지 않았다.
- 왜 문제인지: 분모가 0이면 해당 relative error는 정의되지 않는다. machine epsilon과 unit roundoff를 구별하지 않으면 뒤의 error bound에서 상수가 달라진다.
- 어떻게 수정해야 하는지: exact value와 rounded value의 역할, $x\ne0$, rounding mode를 명시하고 machine epsilon / unit roundoff의 convention을 직접 작성할 것.

### 2.2 Error types and exceptions

- truncation error: infinite decimal을 잘라서 발생하는 error.
- rounding-off error: TODO
- overflow / underflow: TODO
- error magnification: TODO
- computation error: algorithm이나 iteration에서 발생하는 error.

[수정 필요]

- 문제: truncation error를 decimal을 자르는 error로 한정하고, computation error와 rounding-off error의 구분도 불명확하다.
- 왜 문제인지: numerical analysis의 truncation error에는 무한 과정이나 연속 문제의 근사에서 발생하는 error가 포함되며, binary representation의 rounding과 같은 범주로 섞으면 원인을 구분하기 어렵다.
- 어떻게 수정해야 하는지: approximation / truncation, representation / rounding, conditioning에 따른 error amplification을 구분해 직접 정리하고 overflow / underflow의 처리 범위를 채울 것.

#### Absorption

원문의 주장: $|x-y|>2^{52}$이고 $y$가 더 작으면 $fl(x+y)=fl(x)$이다.

[수정 필요]

- 문제: $|x-y|>2^{52}$만으로 작은 항이 사라진다고 주장한다.
- 왜 문제인지: absorption은 두 수의 차이에 대한 고정된 threshold가 아니라 큰 수 주변의 spacing과 rounding mode에 의존한다.
- 어떻게 수정해야 하는지: $x,y$의 부호와 표현 가능 여부를 명시하고 ulp와 rounding interval로 조건을 다시 세울 것. 현재 부등식이 성립하지만 합이 바뀌는 반례를 직접 확인할 것.

#### Loss of significance

가까운 두 수의 subtraction에서는 loss of significance가 발생할 수 있다. 원문의 두 식은 다음과 같다.

$$
f_1(x)=\sqrt{x}(\sqrt{x+1}-\sqrt{x}),\qquad
f_2(x)=\frac{\sqrt{x}}{\sqrt{x+1}-\sqrt{x}}.
$$

원문은 두 식이 mathematically equal이라고 주장한다.

[수정 필요]

- 문제: 두 displayed formula는 같지 않으며, 아래 code의 $f_2$는 denominator에 plus를 사용한다.
- 왜 문제인지: rationalization에 사용해야 하는 conjugate의 부호가 본문과 code에서 다르다. 이 상태에서는 안정성 비교의 대상 자체가 다르다.
- 어떻게 수정해야 하는지: 본문의 denominator 부호를 code와 대조해 수정하고, 허용 domain과 rationalization의 핵심 중간 단계를 직접 확인할 것.

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

[보완 권장]

- 현재 설명의 한계: 50-digit Decimal 실험을 IEEE binary64의 직접 실험처럼 읽을 수 있고, cancellation의 원인이 설명되지 않았다.
- 추가하면 좋은 내용: Decimal precision과 binary64 precision을 구분하고, 각 square root의 rounding error가 subtraction 후 상대적으로 커지는 위치를 직접 표시할 것.
- 이유: 같은 algebraic expression의 evaluation order와 arithmetic model을 구분해야 실험의 의미를 복원할 수 있다.

### 2.3 Non-associativity

Rounding 때문에 floating-point addition은 associative하지 않다.

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

원문의 error claim: $n$개 항의 summation에서 $O(n\epsilon)$을 보장한다.

[수정 필요]

- 문제: heading이 TwoSum과 Kahan compensated summation을 혼동한다. 아래 function의 type annotation은 Python syntax에 맞지 않고 return이 없다. $O(n\epsilon)$은 어떤 error인지 명시하지 않는다.
- 왜 문제인지: 두 algorithm의 목적과 output이 다르며, 현재 code는 실행할 수 없다. absolute / relative error와 summation conditioning 없이 정확도 claim을 비교할 수 없다.
- 어떻게 수정해야 하는지: algorithm 이름과 output contract를 확인하고 annotation / return을 직접 수정할 것. rounding assumption, unit roundoff, 입력 크기와 cancellation을 포함하는 error statement를 출처와 대조할 것.

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

Kahan summation의 보완을 목표로 한 초안이다. 원문의 error claim은 $O(n\epsilon)$이다.

[수정 필요]

- 문제: magnitude 비교에 partial sum $t$ 대신 total을 사용하고, 첫 branch의 correction에서 $x\_ele$를 빼고 있다. type annotation도 Python syntax에 맞지 않는다.
- 왜 문제인지: correction이 rounding에서 잃은 항을 복구하지 못해 정확한 합조차 훼손할 수 있다.
- 어떻게 수정해야 하는지: Neumaier 원식과 magnitude 조건 및 correction의 부호를 대조해 직접 고칠 것. 두 branch, 큰 cancellation, 정확히 표현되는 작은 정수 합을 검증하고 error claim의 norm / scale / assumptions를 명시할 것.

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

[수정 필요]

- 문제: subnormal의 bit weight가 한 자리 어긋나며 기본 bins의 exponent 범위가 binary64의 작은 자리들을 잘라낸다. infinity는 sign과 뒤의 NaN을 확인하지 않고 즉시 반환한다.
- 왜 문제인지: finite input의 정보가 사라지고 special value의 합도 틀릴 수 있다. float counter와 마지막 floating-point summation 역시 exact accumulation / final rounding을 보장하지 않는다.
- 어떻게 수정해야 하는지: normal / subnormal의 bit-to-exponent mapping과 필요한 전체 exponent 범위를 직접 검산할 것. integer accumulation, carry 및 최종 rounding, ±infinity / NaN policy, return contract를 설계하고 각 경계값으로 확인할 것.

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

- [Goldberg, What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html): representation, rounding, cancellation, compensated summation 검토.
- [Ogita–Rump–Oishi, Accurate Sum and Dot Product](https://www.tuhh.de/ti3/paper/rump/OgRuOi05.pdf): TwoSum, error-free transformation과 summation error의 구분 검토.
