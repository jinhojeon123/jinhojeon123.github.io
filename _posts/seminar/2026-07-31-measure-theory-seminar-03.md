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

For measurable spaces $(X,\mathcal M)$ and $(Y,\mathcal N)$, suppose $\mathcal N=\sigma(\mathcal E)$. A function $f:X\to Y$ is $(\mathcal M,\mathcal N)$-measurable if and only if

$$
f^{-1}(E)\in\mathcal M\qquad\text{for every }E\in\mathcal E
$$


[Suggested addition]

- Limitation of the current explanation: There is no explanation of why checking only a generating collection is sufficient.
- Suggested addition: Prove that the collection of sets with measurable preimages is a $\sigma$-algebra, and explain the motivation for this criterion.
- Reason: This technique recurs in later measurability proofs.

## Proposition 2.3

For a measurable space $(X,\mathcal M)$ and a function $f:X\to\mathbb R$, the following are equivalent.

1. $f$ is $\mathcal M$-measurable.
2. For every $a\in\mathbb R$, $f^{-1}((a,\infty))\in\mathcal M$.
3. For every $a\in\mathbb R$, $f^{-1}([a,\infty))\in\mathcal M$.
4. For every $a\in\mathbb R$, $f^{-1}((-\infty,a))\in\mathcal M$.
5. For every $a\in\mathbb R$, $f^{-1}((-\infty,a])\in\mathcal M$.

[Suggested addition]

- Limitation of the current explanation: The codomain $\sigma$-algebra and the dependency on Proposition 2.1 are implicit.
- Suggested addition: Specify the Borel $\sigma$-algebra on $\mathbb R$ and verify generation by each family.
- Reason: This prevents incorrectly applying the same criterion to an arbitrary codomain $\sigma$-algebra.

## Proposition 2.13

For nonnegative simple functions $\phi,\psi$ on a measure space $(X,\mathcal M,\mu)$ and $E\in\mathcal M$,

$$
\int_E c\phi\,d\mu=c\int_E\phi\,d\mu\qquad(c\ge0),
$$

$$
\int_E(\phi+\psi)\,d\mu=\int_E\phi\,d\mu+\int_E\psi\,d\mu.
$$

if $\phi\le\psi$,

$$
\int_E\phi\,d\mu\le\int_E\psi\,d\mu.
$$

and if $E_n\uparrow E$,

$$
\lim_{n\to\infty}\int_{E_n}\phi\,d\mu=\int_E\phi\,d\mu.
$$

[Suggested addition]

- Limitation of the current explanation: The definition of a simple-function integral and the extended-integral conventions are omitted.
- Suggested addition: Supply the integral definition via the canonical representation, independence of representation, the convention $0\cdot\infty=0$, and the connection to continuity from below of the measure.
- Reason: The meaning of statements involving $c=0$ or infinite integrals must be fixed.

## Monotone Convergence Theorem

On a measure space $(X,\mathcal M,\mu)$, suppose $\{f_n\}_{n=1}^{\infty}\subset L^+$ satisfies $f_n\le f_{n+1}$ for every $n$. Set

$$
f(x)=\lim_{n\to\infty}f_n(x)=\sup_n f_n(x),
$$

Then $f\in L^+$ and

$$
\int_X f\,d\mu=\lim_{n\to\infty}\int_X f_n\,d\mu.
$$

[Correction required]

- Issue: The definition of $L^+$ and the proof of MCT are missing, so the theorem cannot be reconstructed from this note alone.
- Why this matters: It is unclear whether the functions are nonnegative, measurable, and extended-valued. The argument passing from the supremum defining the integral to the limit is missing.
- Required revision: Specify the domain, codomain, and measurability in $L^+$, and complete the lower-bound proof using simple functions and $0<c<1$. Check the union of the increasing sets and the step $c\uparrow1$.

### Proof of MCT — TODO

### Discussion — TODO

## Questions

- Which measurability checks can be simplified by Proposition 2.1?
- Why is $c\phi$ introduced in the proof of MCT?
- How are the sets $E_n$ defined in the MCT proof, and to which set do they increase?
- Why is pointwise convergence sufficient under the nonnegativity and monotonicity assumptions of MCT?
