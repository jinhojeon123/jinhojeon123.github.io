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

For a measure space $(X,\mathcal M,\mu)$,

$$
\mathcal L^p(X)=\left\{f:X\to\mathbb R\text{ measurable}:\int_X|f|^p\,d\mu<\infty\right\},
\qquad
\|f\|_p=\left(\int_X|f|^p\,d\mu\right)^{1/p}.
$$

### The Case $p=\infty$ / Essential Supremum

### Equality Almost Everywhere / Equivalence Classes

Since $\|f\|_p=0$ guarantees only $f=0$ almost everywhere, functions that agree almost everywhere are identified.

### The Space $L^p$

[Correction required]

- Issue: The quotient definition taking $\mathcal L^p$ to $L^p$ and the definition of $L^\infty$ are missing.
- Why this matters: The later discussion uses Banach spaces and endpoints without distinguishing a seminorm on actual functions from a norm on equivalence classes.
- Required revision: Specify the equivalence relation, quotient $L^p$, and independence of representatives. Supply the essential-supremum quantifier, $L^\infty$, and its norm. Also fix the scalar field for the complex-valued version used in §9.

### Basic Properties of the $L^p$-Norm

### First Examples: $L^1$, $L^2$, and $L^\infty$

## 3. Young's Inequality

### Conjugate Exponents / Statement

For $1<p<\infty$, define the conjugate exponent $q$ by

$$
\frac1p+\frac1q=1,\qquad q=\frac p{p-1}
$$

For $a,b\ge0$,

$$
ab\le\frac{a^p}{p}+\frac{b^q}{q}.
$$

### Proof / Equality Case — TODO

[Suggested addition]

- Limitation of the current explanation: Only the statement is present; the proof and equality condition are missing.
- Suggested addition: Supply the key convexity or calculus argument and the equality condition.
- Reason: The pointwise estimate leading to Hölder should be reconstructible from its argument.

### Connection to Hölder

Integrating the pointwise estimate in Young's inequality gives Hölder's inequality.

## 4. Hölder's Inequality

### Statement

If $1/p+1/q=1$, $f\in L^p(X)$, and $g\in L^q(X)$, then $fg\in L^1(X)$ and

$$
\|fg\|_1\le\|f\|_p\|g\|_q.
$$

### Normalization / Proof Using Young — TODO

The functions used for normalization are

$$
\frac{|f|}{\|f\|_p},\qquad \frac{|g|}{\|g\|_q}.
$$

[Correction required]

- Issue: The exponent range and zero-norm case are not specified, and the proof after normalization is missing.
- Why this matters: The displayed divisions are undefined when $\|f\|_p=0$ or $\|g\|_q=0$, and the Young-inequality argument does not apply directly at the endpoints.
- Required revision: State $1\le p,q\le\infty$ and the convention $1/\infty=0$, and separate the zero-norm case. Complete the normalized Young-inequality integration for $1<p<\infty$ and the endpoint proofs separately.

### Endpoint Case: $p=1$, $q=\infty$ — TODO

### Cauchy–Schwarz / Product Integrability

When $p=q=2$,

$$
\int_X|fg|\,d\mu\le\|f\|_2\|g\|_2.
$$

Hölder controls integrability of products: $L^p\times L^q\to L^1$.

### Equality Case — TODO

## 5. Minkowski's Inequality

### Statement

For $1\le p\le\infty$,

$$
\|f+g\|_p\le\|f\|_p+\|g\|_p.
$$

[Correction required]

- Issue: Membership assumptions on $f,g$ are omitted, and $f+g\in L^p$ is not established before applying Hölder.
- Why this matters: Dividing by $\|f+g\|_p$ before knowing it is finite creates a circular argument.
- Required revision: State $f,g\in L^p(X)$ and establish finiteness first through a preliminary integrability estimate or truncation. Separate the zero-norm case and the endpoints $p=1,\infty$.

### The Case $p=1$ — TODO

### The Case $1<p<\infty$ / Applying Hölder

The pointwise triangle inequality gives

$$
|f+g|^p=|f+g||f+g|^{p-1}
\le |f||f+g|^{p-1}+|g||f+g|^{p-1}.
$$

For the conjugate exponent $q=p/(p-1)$, we have $(p-1)q=p$.

### Completion of the Proof / Endpoint $p=\infty$ — TODO

### Triangle Inequality / Normed Vector Space — TODO

## 6. Relations Between $L^p$ Spaces

### Finite Measure / Inclusion / Norm Estimate

If $\mu(X)<\infty$ and $1\le p<q\le\infty$, then $L^q(X)\subset L^p(X)$ and

$$
\|f\|_p\le\mu(X)^{1/p-1/q}\|f\|_q.
$$

### Proof Using Hölder — TODO

[Suggested addition]

- Limitation of the current explanation: There is no proof connecting the norm estimate to the finite-measure assumption.
- Suggested addition: Identify the two functions and conjugate exponents used in Hölder, treat $q=\infty$, and link the infinite-measure counterexample in §7.
- Reason: These dependencies allow reconstruction of the exponents and measure factor without memorization.

### What Happens on Infinite Measure Spaces? — TODO

## 7. Examples and Counterexamples

### Power Functions Near Zero

For $f(x)=x^{-\alpha}$ with $x\in(0,1)$,

$$
f\in L^p(0,1)\quad\Longleftrightarrow\quad\alpha p<1.
$$

### Power Functions Near Infinity

For $f(x)=x^{-\alpha}$ with $x\in(1,\infty)$,

$$
f\in L^p(1,\infty)\quad\Longleftrightarrow\quad\alpha p>1.
$$

[Correction required]

- Issue: The two power-function criteria omit the finite range of $p$, the range of $\alpha$, and the measure.
- Why this matters: The earlier discussion permits $p=\infty$, so $\alpha p$ could be misread as an endpoint criterion. The same integral test does not hold for a general measure.
- Required revision: Specify Lebesgue measure, $1\le p<\infty$, and $\alpha\in\mathbb R$, and check $p=\infty$ separately through essential boundedness.

### $L^p\setminus L^q$ / $L^q\setminus L^p$ — TODO

### No Universal Inclusion on $\mathbb R$ — TODO

### Comparing $L^1$, $L^2$, and $L^\infty$ — TODO

## 8. Completeness of $L^p$

### Cauchy Sequences / Banach Spaces

A sequence $\{f_n\}$ in a normed space is Cauchy if

$$
\forall\varepsilon>0,\quad\exists N:\quad
m,n\ge N\implies\|f_n-f_m\|<\varepsilon
$$

A space is complete if every Cauchy sequence converges to an element of that space. A complete normed vector space is a **Banach space**.

### Completeness Theorem

For $1\le p\le\infty$, $L^p(X)$ is complete and hence is a Banach space.

### Proof: Rapidly Convergent Subsequence / Summable Differences

From an $L^p$-Cauchy sequence $\{f_n\}$, choose a subsequence satisfying

$$
\|f_{n_{k+1}}-f_{n_k}\|_p<2^{-k}
$$

and define the following quantities:

$$
g_m=\sum_{k=1}^m|f_{n_{k+1}}-f_{n_k}|,
$$

By Minkowski,

$$
\|g_m\|_p\le\sum_{k=1}^m\|f_{n_{k+1}}-f_{n_k}\|_p
<\sum_{k=1}^m2^{-k}\le1.
$$

### Proof: Monotone Limit / Pointwise Convergence

Since $0\le g_1\le g_2\le\cdots$,

$$
g=\lim_{m\to\infty}g_m
=\sum_{k=1}^\infty|f_{n_{k+1}}-f_{n_k}|.
$$

Use MCT/Fatou to establish $g\in L^p$. Then $g(x)<\infty$ almost everywhere, so

$$
\sum_{k=1}^\infty|f_{n_{k+1}}(x)-f_{n_k}(x)|<\infty
\qquad\text{a.e.}
$$

Thus $\{f_{n_k}(x)\}$ is a Cauchy sequence in $\mathbb R$ almost everywhere. At points where the limit exists, define

$$
f(x)=\lim_{k\to\infty}f_{n_k}(x)
$$


### Proof: $L^p$ Convergence / Original Sequence — TODO

It remains to prove $f_{n_k}\to f$ in $L^p$. The Cauchy property of the original sequence then gives $f_n\to f$ in $L^p$, establishing completeness.

[Correction required]

- Issue: The claims $g\in L^p$, measurable extension and membership of $f$, and norm convergence remain TODOs. The proof for $p=\infty$ is not separated.
- Why this matters: Pointwise almost-everywhere convergence alone does not imply $L^p$ convergence. Applying MCT/Fatou to $p$th powers does not cover $p=\infty$.
- Required revision: For $1\le p<\infty$, complete the limit argument for $g_m^p$ and the summable-tail estimate, and define $f$ on the exceptional measurable null set. Then write the triangle estimate returning to the original sequence. For $p=\infty$, give a separate uniform Cauchy argument outside a common null set.

[Suggested addition]

- Limitation of the current explanation: The purpose of selecting the subsequence is not explained.
- Suggested addition: State the proof idea in your own words: summable norm increments → almost-everywhere absolute convergence → norm convergence.
- Reason: This subsequence technique also appears in other completeness and convergence arguments.

## 9. Why $L^2$ Is Special

### Inner Product / Induced Norm

For real-valued functions,

$$
\langle f,g\rangle_{L^2}=\int_Xfg\,d\mu,
$$

for complex-valued functions,

$$
\langle f,g\rangle_{L^2}=\int_Xf\overline g\,d\mu.
$$

The induced norm is $\|f\|_2=\sqrt{\langle f,f\rangle_{L^2}}$.

### Hilbert Spaces / Banach vs. Hilbert

A complete inner product space is a **Hilbert space**. Since $L^2$ is complete, $L^2(X)$ is a Hilbert space. Every Hilbert space is a Banach space under its induced norm, but the converse does not hold in general.

[Suggested addition]

- Limitation of the current explanation: It is unclear where well-definedness of the inner product is established and where the real-valued convention of §2 is extended.
- Suggested addition: State $f,g\in L^2$, integrability by Cauchy–Schwarz, independence of representatives, the complex scalar field, and the convention for the linear slot.
- Reason: The canonical pairing in the subsequent duality discussion must be distinguished from a Hilbert inner product.

## 10. Connections / Next Seminar

### Weak Derivatives / Sobolev Preview

PDEs require control of $D_i u$ as well as $\|u\|_p$. This leads beyond classical differentiability to weak derivatives. The existing preview is

$$
W^{1,p}(\Omega)
=\{u\in L^p(\Omega):D_i u\in L^p(\Omega)\},
\qquad H^1(\Omega)=W^{1,2}(\Omega).
$$

[Correction required]

- Issue: Conditions on $\Omega$, the quantifier on $i$, and the meaning of $D_i$ are missing.
- Why this matters: An expression that does not distinguish classical from weak derivatives is not a precise definition of a Sobolev space.
- Required revision: Specify that $\Omega\subset\mathbb R^n$ is open, quantify over all $i=1,\ldots,n$, and identify distributional/weak derivatives. Keep this location as a preview and develop the actual definition and proof in the later §9.3 study.

### Next Seminar

- [Week 05 — Duality of Lp]({% link _posts/folland-seminar/2026-09-11-folland-week-05-duality-of-lp.md %})
- Prerequisite TODO: bounded linear functionals, Lebesgue–Radon–Nikodym Theorem, simple-function density

## What I should remember

$$
L^p\longrightarrow\text{Young}\longrightarrow\text{Hölder}
\longrightarrow\text{Minkowski}\longrightarrow L^p\text{ relations}
\longrightarrow\text{Banach structure}
$$

This note follows pointwise estimates → product integrability → the triangle inequality → completeness. At $p=2$, an inner product is added. Duality and weak derivatives then lead to Sobolev spaces and PDEs.
