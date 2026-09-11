---
title: "Measure Theory Seminar 04 – Lp Spaces and Fundamental Inequalities"
date: 2026-08-14 00:00:00 +0900
categories: ["Mathematics"]
tags: ["functional-analysis", "lp-spaces", "young-inequality", "holder-inequality", "minkowski-inequality", "banach-space", "hilbert-space"]
description: "Seminar working note on Lp spaces and their inequalities, completeness, and relation to Sobolev spaces; several sections are outlines."
status: "working-note"
note_type: "seminar"
math: true
toc: true
permalink: "/posts/lp-spaces-and-inequalities/"
series: "measure-theory"
series_order: 9
---

## 1. From Lebesgue Integration to $L^p$

### What Did $L^1$ Measure?

### Why Consider $|f|^p$?

### How Does $p$ Change the Notion of Size?

### From Integrability to Function Spaces

## 2. $L^p$ Spaces

### Definition for $1\le p<\infty$

Measure space $(X,\mathcal M,\mu)$에 대하여

$$
\mathcal L^p(X)=\left\{f:X\to\mathbb R\text{ measurable}:\int_X|f|^p\,d\mu<\infty\right\},
\qquad
\|f\|_p=\left(\int_X|f|^p\,d\mu\right)^{1/p}.
$$

### The Case $p=\infty$ / Essential Supremum

### Equality Almost Everywhere / Equivalence Classes

$\|f\|_p=0$에서는 $f=0$ a.e.만 보장되므로 a.e. 같은 함수들을 동일시한다.

### The Space $L^p$

[수정 필요]

- 문제: $\mathcal L^p$에서 $L^p$로 가는 quotient definition과 $L^\infty$의 definition이 비어 있다.
- 왜 문제인지: actual functions 위의 seminorm과 equivalence classes 위의 norm을 구분하지 않은 채 뒤에서 Banach space와 endpoint를 사용한다.
- 어떻게 수정해야 하는지: equivalence relation, quotient $L^p$, representative independence를 직접 명시한다. essential supremum의 quantifier, $L^\infty$와 그 norm을 채운다. §9에서 사용할 complex-valued version의 scalar field도 정한다.

### Basic Properties of the $L^p$-Norm

### First Examples: $L^1$, $L^2$, and $L^\infty$

## 3. Young's Inequality

### Conjugate Exponents / Statement

$1<p<\infty$에서 conjugate exponent $q$는

$$
\frac1p+\frac1q=1,\qquad q=\frac p{p-1}
$$

로 정한다. $a,b\ge0$에 대해

$$
ab\le\frac{a^p}{p}+\frac{b^q}{q}.
$$

### Proof / Equality Case — TODO

[보완 권장]

- 현재 설명의 한계: statement만 있고 proof와 equality condition이 비어 있다.
- 추가하면 좋은 내용: 사용할 convexity 또는 calculus argument의 핵심과 equality condition.
- 이유: Hölder로 이어지는 pointwise estimate가 왜 성립하는지 복원할 수 있어야 한다.

### Connection to Hölder

Young's inequality의 pointwise estimate를 적분하여 Hölder's inequality를 얻는다.

## 4. Hölder's Inequality

### Statement

$1/p+1/q=1$, $f\in L^p(X)$, $g\in L^q(X)$이면 $fg\in L^1(X)$이고

$$
\|fg\|_1\le\|f\|_p\|g\|_q.
$$

### Normalization / Proof Using Young — TODO

Normalization에 사용하는 함수는

$$
\frac{|f|}{\|f\|_p},\qquad \frac{|g|}{\|g\|_q}.
$$

[수정 필요]

- 문제: statement의 exponent 범위와 zero-norm case가 명시되지 않고 normalization 뒤 proof가 비어 있다.
- 왜 문제인지: $\|f\|_p=0$ 또는 $\|g\|_q=0$이면 위 나눗셈은 정의되지 않으며 Young argument는 endpoint에 직접 적용되지 않는다.
- 어떻게 수정해야 하는지: $1\le p,q\le\infty$, $1/\infty=0$ convention을 명시하고 zero-norm case를 분리한다. $1<p<\infty$의 normalized Young integration과 endpoint proof를 각각 직접 채운다.

### Endpoint Case: $p=1$, $q=\infty$ — TODO

### Cauchy–Schwarz / Product Integrability

$p=q=2$이면

$$
\int_X|fg|\,d\mu\le\|f\|_2\|g\|_2.
$$

Hölder는 product의 integrability를 제어한다: $L^p\times L^q\to L^1$.

### Equality Case — TODO

## 5. Minkowski's Inequality

### Statement

$1\le p\le\infty$에 대하여

$$
\|f+g\|_p\le\|f\|_p+\|g\|_p.
$$

[수정 필요]

- 문제: $f,g$의 membership assumption이 생략되었고 Hölder 적용 전 $f+g\in L^p$를 확보하는 단계가 없다.
- 왜 문제인지: 아직 finite인지 모르는 $\|f+g\|_p$로 나누면 circular argument가 된다.
- 어떻게 수정해야 하는지: $f,g\in L^p(X)$를 명시하고 preliminary integrability estimate 또는 truncation으로 finiteness를 먼저 확보한다. zero-norm case와 $p=1,\infty$ endpoint도 분리한다.

### The Case $p=1$ — TODO

### The Case $1<p<\infty$ / Applying Hölder

Pointwise triangle inequality를 이용하면

$$
|f+g|^p=|f+g||f+g|^{p-1}
\le |f||f+g|^{p-1}+|g||f+g|^{p-1}.
$$

Conjugate exponent $q=p/(p-1)$에 대해 $(p-1)q=p$이다.

### Completion of the Proof / Endpoint $p=\infty$ — TODO

### Triangle Inequality / Normed Vector Space — TODO

## 6. Relations Between $L^p$ Spaces

### Finite Measure / Inclusion / Norm Estimate

$\mu(X)<\infty$, $1\le p<q\le\infty$이면 $L^q(X)\subset L^p(X)$이며

$$
\|f\|_p\le\mu(X)^{1/p-1/q}\|f\|_q.
$$

### Proof Using Hölder — TODO

[보완 권장]

- 현재 설명의 한계: norm estimate와 finite measure assumption의 역할을 연결하는 proof가 없다.
- 추가하면 좋은 내용: Hölder에 넣을 두 함수와 conjugate exponents, $q=\infty$ case, infinite measure 반례의 §7 연결.
- 이유: exponent와 measure factor를 암기하지 않고 복원하기 위한 dependency이다.

### What Happens on Infinite Measure Spaces? — TODO

## 7. Examples and Counterexamples

### Power Functions Near Zero

$f(x)=x^{-\alpha}$, $x\in(0,1)$에 대해

$$
f\in L^p(0,1)\quad\Longleftrightarrow\quad\alpha p<1.
$$

### Power Functions Near Infinity

$f(x)=x^{-\alpha}$, $x\in(1,\infty)$에 대해

$$
f\in L^p(1,\infty)\quad\Longleftrightarrow\quad\alpha p>1.
$$

[수정 필요]

- 문제: 두 power-function 판정에서 $p$의 finite 범위, $\alpha$의 범위와 measure가 생략되었다.
- 왜 문제인지: 앞에서는 $p=\infty$도 허용하므로 $\alpha p$를 endpoint 판정으로 읽을 수 있다. 일반 measure에서는 같은 적분 판정이 성립하지 않는다.
- 어떻게 수정해야 하는지: Lebesgue measure, $1\le p<\infty$, $\alpha\in\mathbb R$를 명시하고 $p=\infty$는 essential boundedness로 별도 확인한다.

### $L^p\setminus L^q$ / $L^q\setminus L^p$ — TODO

### No Universal Inclusion on $\mathbb R$ — TODO

### Comparing $L^1$, $L^2$, and $L^\infty$ — TODO

## 8. Completeness of $L^p$

### Cauchy Sequences / Banach Spaces

Normed space의 sequence $\{f_n\}$가 Cauchy라는 것은

$$
\forall\varepsilon>0,\quad\exists N:\quad
m,n\ge N\implies\|f_n-f_m\|<\varepsilon
$$

라는 뜻이다. 모든 Cauchy sequence가 그 space의 원소로 수렴하면 complete라고 하며, complete normed vector space를 **Banach space**라고 한다.

### Completeness Theorem

$1\le p\le\infty$에서 $L^p(X)$는 complete이므로 Banach space이다.

### Proof: Rapidly Convergent Subsequence / Summable Differences

$L^p$-Cauchy sequence $\{f_n\}$에서

$$
\|f_{n_{k+1}}-f_{n_k}\|_p<2^{-k}
$$

를 만족하는 subsequence를 선택한다. 다음을 놓으면

$$
g_m=\sum_{k=1}^m|f_{n_{k+1}}-f_{n_k}|,
$$

Minkowski에 의해

$$
\|g_m\|_p\le\sum_{k=1}^m\|f_{n_{k+1}}-f_{n_k}\|_p
<\sum_{k=1}^m2^{-k}\le1.
$$

### Proof: Monotone Limit / Pointwise Convergence

$0\le g_1\le g_2\le\cdots$이므로

$$
g=\lim_{m\to\infty}g_m
=\sum_{k=1}^\infty|f_{n_{k+1}}-f_{n_k}|.
$$

MCT / Fatou를 이용하여 $g\in L^p$를 보여야 한다. 그러면 $g(x)<\infty$ a.e.이므로

$$
\sum_{k=1}^\infty|f_{n_{k+1}}(x)-f_{n_k}(x)|<\infty
\qquad\text{a.e.}
$$

따라서 $\{f_{n_k}(x)\}$는 a.e.에서 $\mathbb R$의 Cauchy sequence이다. Limit이 존재하는 점에서

$$
f(x)=\lim_{k\to\infty}f_{n_k}(x)
$$

로 놓는다.

### Proof: $L^p$ Convergence / Original Sequence — TODO

보여야 할 것은 $f_{n_k}\to f$ in $L^p$이다. 이를 보이면 원래 sequence의 Cauchy property로부터 $f_n\to f$ in $L^p$를 얻어 completeness가 따른다.

[수정 필요]

- 문제: $g\in L^p$, $f$의 measurable extension과 membership, norm convergence가 TODO이고 $p=\infty$ proof가 분리되지 않았다.
- 왜 문제인지: pointwise a.e. convergence만으로 $L^p$ convergence는 나오지 않는다. MCT / Fatou를 $p$-th power에 적용하는 argument는 $p=\infty$를 다루지 않는다.
- 어떻게 수정해야 하는지: $1\le p<\infty$에서 $g_m^p$의 limit과 summable tail estimate를 직접 채우고 exceptional measurable null set에서 $f$를 정의한다. 이후 원래 sequence로 돌아가는 triangle estimate를 적는다. $p=\infty$에는 공통 null set 밖 uniform Cauchy argument를 별도로 작성한다.

[보완 권장]

- 현재 설명의 한계: subsequence 선택의 목적이 드러나지 않는다.
- 추가하면 좋은 내용: summable norm increments → a.e. absolute convergence → norm convergence라는 proof idea를 자기 말로 기록.
- 이유: 이 subsequence technique은 다른 completeness 및 convergence argument에도 반복된다.

## 9. Why $L^2$ Is Special

### Inner Product / Induced Norm

Real-valued functions에서는

$$
\langle f,g\rangle_{L^2}=\int_Xfg\,d\mu,
$$

complex-valued functions에서는

$$
\langle f,g\rangle_{L^2}=\int_Xf\overline g\,d\mu.
$$

Induced norm은 $\|f\|_2=\sqrt{\langle f,f\rangle_{L^2}}$이다.

### Hilbert Spaces / Banach vs. Hilbert

Complete inner product space를 **Hilbert space**라고 한다. $L^2$가 complete이므로 $L^2(X)$는 Hilbert space이다. 모든 Hilbert space는 induced norm에 대해 Banach space지만 그 역은 일반적으로 성립하지 않는다.

[보완 권장]

- 현재 설명의 한계: inner product의 well-definedness와 §2의 real-valued convention을 확장하는 위치가 분명하지 않다.
- 추가하면 좋은 내용: $f,g\in L^2$와 Cauchy–Schwarz에 의한 integrability, representative independence, complex scalar field와 linear-slot convention.
- 이유: 다음 duality의 canonical pairing과 Hilbert inner product를 혼동하지 않아야 한다.

## 10. Connections / Next Seminar

### Weak Derivatives / Sobolev Preview

PDE에서는 $\|u\|_p$뿐 아니라 $D_i u$도 제어해야 한다. Classical differentiability의 제약에서 weak derivative로 나아간다. 기존 preview는 다음과 같다.

$$
W^{1,p}(\Omega)
=\{u\in L^p(\Omega):D_i u\in L^p(\Omega)\},
\qquad H^1(\Omega)=W^{1,2}(\Omega).
$$

[수정 필요]

- 문제: $\Omega$의 조건, index $i$의 quantifier, $D_i$의 의미가 빠져 있다.
- 왜 문제인지: classical derivative와 weak derivative를 구별하지 않은 식은 Sobolev space의 정확한 definition이 아니다.
- 어떻게 수정해야 하는지: $\Omega\subset\mathbb R^n$ open, 모든 $i=1,\ldots,n$, distributional/weak derivative라는 조건을 명시한다. 이 위치는 preview로 두고 실제 definition과 proof는 이후 §9.3 study에서 직접 채운다.

### Next Seminar

- [Week 05 — Duality of Lp]({% link Folland-Seminar/Week-05-Duality-of-Lp.md %})
- Prerequisite TODO: bounded linear functionals, Lebesgue–Radon–Nikodym Theorem, simple-function density

## What I should remember

$$
L^p\longrightarrow\text{Young}\longrightarrow\text{Hölder}
\longrightarrow\text{Minkowski}\longrightarrow L^p\text{ relations}
\longrightarrow\text{Banach structure}
$$

Pointwise estimate → product integrability → triangle inequality → completeness가 이 글의 연결이다. $p=2$에서는 inner product가 더해진다. 이후 duality와 weak derivatives를 거쳐 Sobolev spaces 및 PDE로 연결한다.
