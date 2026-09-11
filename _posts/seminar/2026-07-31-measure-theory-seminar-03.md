---
title: "Measure Theory Seminar 03 – Measurable Functions and the Monotone Convergence Theorem"
date: 2026-07-31
categories: ["Mathematics"]
tags: ["measure-theory", "measurable-functions", "monotone-convergence", "folland"]
description: "Seminar statements on measurable functions, simple-function integration, and monotone convergence; the proof section remains a placeholder."
status: "working-note"
note_type: "seminar"
math: true
toc: true
permalink: "/seminar/measure theory seminar/2026/07/31/measure-theory-seminar-03.html"
series: "measure-theory"
series_order: 7
---

# Measurability and Integration

## Proposition 2.1

Measurable spaces $(X,\mathcal M)$, $(Y,\mathcal N)$에서 $\mathcal N=\sigma(\mathcal E)$라 하자. 함수 $f:X\to Y$가 $(\mathcal M,\mathcal N)$-measurable일 필요충분조건은

$$
f^{-1}(E)\in\mathcal M\qquad\text{for every }E\in\mathcal E
$$

이다.

[보완 권장]

- 현재 설명의 한계: generating collection만 검사해도 되는 이유가 없다.
- 추가하면 좋은 내용: measurable preimage를 갖는 집합들의 collection이 $\sigma$-algebra가 되는 proof와 이 판정법의 motivation.
- 이유: 이후 measurability proof에서 반복 사용하는 technique이다.

## Proposition 2.3

Measurable space $(X,\mathcal M)$와 함수 $f:X\to\mathbb R$에 대하여 다음은 동치이다.

1. $f$는 $\mathcal M$-measurable이다.
2. 모든 $a\in\mathbb R$에 대하여 $f^{-1}((a,\infty))\in\mathcal M$.
3. 모든 $a\in\mathbb R$에 대하여 $f^{-1}([a,\infty))\in\mathcal M$.
4. 모든 $a\in\mathbb R$에 대하여 $f^{-1}((-\infty,a))\in\mathcal M$.
5. 모든 $a\in\mathbb R$에 대하여 $f^{-1}((-\infty,a])\in\mathcal M$.

[보완 권장]

- 현재 설명의 한계: codomain의 $\sigma$-algebra와 Proposition 2.1과의 dependency가 암묵적이다.
- 추가하면 좋은 내용: $\mathbb R$의 Borel $\sigma$-algebra 명시와 각 family의 generation 확인.
- 이유: 임의의 codomain $\sigma$-algebra에 같은 판정을 적용하는 혼동을 막는다.

## Proposition 2.13

Measure space $(X,\mathcal M,\mu)$의 nonnegative simple functions $\phi,\psi$와 $E\in\mathcal M$에 대하여

$$
\int_E c\phi\,d\mu=c\int_E\phi\,d\mu\qquad(c\ge0),
$$

$$
\int_E(\phi+\psi)\,d\mu=\int_E\phi\,d\mu+\int_E\psi\,d\mu.
$$

$\phi\le\psi$이면

$$
\int_E\phi\,d\mu\le\int_E\psi\,d\mu.
$$

또한 $E_n\uparrow E$이면

$$
\lim_{n\to\infty}\int_{E_n}\phi\,d\mu=\int_E\phi\,d\mu.
$$

[보완 권장]

- 현재 설명의 한계: simple-function integral의 definition과 extended integral convention이 생략되어 있다.
- 추가하면 좋은 내용: canonical representation에 따른 integral definition, representation independence, $0\cdot\infty=0$ convention, measure의 continuity from below와의 연결.
- 이유: $c=0$ 또는 무한 integral을 포함하는 statement의 의미를 고정해야 한다.

## Monotone Convergence Theorem

Measure space $(X,\mathcal M,\mu)$에서 $\{f_n\}_{n=1}^{\infty}\subset L^+$가 모든 $n$에 대해 $f_n\le f_{n+1}$을 만족한다고 하자. 다음과 같이 놓으면

$$
f(x)=\lim_{n\to\infty}f_n(x)=\sup_n f_n(x),
$$

$f\in L^+$이고

$$
\int_X f\,d\mu=\lim_{n\to\infty}\int_X f_n\,d\mu.
$$

[수정 필요]

- 문제: $L^+$의 definition과 MCT의 proof가 비어 있어 이 문서만으로 theorem을 복원할 수 없다.
- 왜 문제인지: extended-valued nonnegative measurable functions인지 분명하지 않고, integral을 정의하는 supremum에서 limit으로 넘어가는 논리가 없다.
- 어떻게 수정해야 하는지: $L^+$의 domain/codomain과 measurability를 명시하고, simple function 및 $0<c<1$을 사용하는 lower-bound proof를 직접 채운다. 증가 집합의 union과 $c\uparrow1$ 단계도 확인한다.

### Proof of MCT — TODO

### Discussion — TODO

## Questions

- Proposition 2.1은 어떤 measurability 검사에 유용한가?
- MCT proof에서 $c\phi$를 도입하는 이유는 무엇인가?
- MCT proof에서 사용하는 $E_n$의 definition은 무엇이며, 어떤 set으로 증가하는가?
- MCT의 nonnegativity와 monotonicity 아래에서 pointwise convergence로 충분한 이유는 무엇인가?
