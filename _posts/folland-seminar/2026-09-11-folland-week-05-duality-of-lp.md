---
layout: post
title: "Folland Week 05 — Duality of Lp"
permalink: /study/folland/week-05-duality-of-lp/
math: true
toc: true
status: outline
date: 2026-09-11 00:00:00 +0900
categories: [Mathematics]
tags: [analysis, folland]
note_type: seminar
series: folland-seminar
series_order: 5
---

- **Main topic:** Duality of Lp
- **Reference:** Folland 2nd edition, §6.2 Part I
- **Prerequisite checklist:** [Unverified prerequisites]({% link study/folland/prerequisite-checklist.md %})

## Prerequisite

- [Seminar 04 — Lp Spaces and Fundamental Inequalities]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %})
- [ ] Folland §§3.1–3.3 — signed / complex measures; Lebesgue–Radon–Nikodym Theorem
- [ ] Folland §§5.1–5.2 — bounded linear functionals; dual norm; Hahn–Banach background
- [ ] Folland §6.1 — completeness; simple-function density; Hölder inequality

## Must cover

- [ ] conjugate exponents p, q
- [ ] canonical pairing; real / complex scalar convention
- [ ] canonical map Lq → (Lp)\*; boundedness; isometry
- [ ] representation of bounded linear functionals; surjectivity
- [ ] Lebesgue–Radon–Nikodym representation; finite-measure localization
- [ ] general measure-space hypotheses; globalization for 1 < p < ∞
- [ ] uniqueness up to a.e. equality
- [ ] endpoint case p = 1 and p = ∞ — Week 06 dependency
- [ ] duality theorem consequences — Week 06 dependency

## Seminar workload

- Total: 165 min
- pairing / isometry: 35 min
- representation / localization: 85 min
- globalization / uniqueness: 30 min
- hypotheses / endpoint handoff: 15 min

## Motivation

From this theorem, we can further understand the meanning of the duality pairing between $L^p$ and $L^q$.

Hölder Inequality tells us that if $g$ is in $L^q$ and $f\in L^{p}$ where $p$ and $q$ are conjugate exponents, then

$$
    fg \in L^{1}
$$

Consequently, for each fixed $g \in L^q$, the map

$$
    f \mapsto \int_{X} fg d \mu \qquad (\because \ fg \in L^{1})
$$

defines a bounded linear founctional on $L^p$.

The $L^p$ duality theorem gives the converse. For $1<p<\infty$, every bounded linear functional

<!-- If p = 1, σ-finiteness of μ is a sufficient condition for the duality theorem. If p = ∞, the theorem generally fails even when μ is σ-finite. For 1 < p < ∞, no σ-finiteness assumption is required. -->

Hence, Hölder's inequality shows how elements of $L^q$ produce bounded linear functional on $L^p$, while the duality theorem tells us that these are, in fact, all the bounded linear functionals on $L^p$.

## Definitions

### Review

- # $L^p(X,\mu)

  \left\{
  f:X\to\mathbb{F}
  \mid
  f\text{ measurable},\
  \left(\int_X |f|^p\,d\mu\right)^{1/p}<\infty
  \right\}$
  - $\triangleright$ measurable functions :

    f

  - $\triangleright$ a.e. equivalence :

    [f] = $\{  \}$

  - $\triangleright$ $L^p$-norm :

    f

- $L^p$ dual :

- Hölder Inequality :

  Let $1 \le p \le \infty$

- MCT(monotone convergence theorem) :

  Let $(X,\mathcal{M},\mu)$ be a measure space.

  If $\{ f_n \}$ is a sequence in $L^{+}$ such that $f_n \le f_{n+1}$ for all $n$, and ${f_n} \rightarrow f$ pointwise, then

  $$
      \lim_{n\to\infty} \int_{X} f_n \ d \mu = \int_{X} f \ d \mu
  $$

- **DCT (Dominated Convergence Theorem)** :

  Let $(X,\mathcal{M},\mu)$ be a measure space, and let $\{f_n\}$ be a sequence of measurable functions.

  Suppose that there exists $g\in L^1(X,\mu)$ such that

  $$
  |f_n(x)|\le g(x)
  \qquad \text{for all } n\in\mathbb N,\ \text{a.e. }x\in X,
  $$

  and

  $$
  f_n(x)\to f(x)
  \qquad \text{a.e. }x\in X.
  $$

  Then $f\in L^1(X,\mu)$ and

  $$
  \lim_{n\to\infty}\int_X f_n\,d\mu
  =
  \int_X f\,d\mu.
  $$

  In fact,

  $$
  \lim_{n\to\infty}\int_X |f_n-f|\,d\mu=0.
  $$

- Isometry :

  Let (X, ${\| \cdot \|}_{X}$) , (Y, ${\| \cdot \|}_{Y}$) be normed vector spaces.

  If $T$ is an isometry function from X to Y, then:

  $$
      \|T \mathbf{x} \|_{Y} = \|\mathbf{x} \|_{Y},  \qquad \ \  \forall x\in X
  $$

- Embedding :

- Isomorphic :

## Main Results

Let p and q be conjugate exponents with $\frac{1}{p} + \frac{1}{q} = 1$.

$L^p(X, \mu)^{*}$ is isometrically isomorphic to $L^{q}$. If $1<p<\infty$ then $\mu$ could be an arbitrary measure, If $p=1$ then $\mu$ should be finite or $\sigma$-finite on X.

## Proofs

### $1 < p < \infty$

#### Case I. $\mu(X) < \infty$

#### Case II. $\mu$ is $\sigma$-finite

#### Case III. $\mu$ is arbitrary

### Other Cases

## Examples / Counterexamples

## Connections

- [ ] Connection: connect prerequisite results on conjugate exponents p, q to the current theorem
- [ ] Next readiness: duality theorem consequences — Week 06 dependency → p = 1 representation; sigma-finite hypothesis

Since $L^{p}(X,\mu)^{*} \cong L^{q}(X,\mu)$,

and $L^{q}(X,\mu)^{*} \cong L^{p}$,

Hence $L^{p}(X,\mu)^{**} \cong L^{q}(X,\mu)^{*} \cong L^{p}$

I.e., $L^{p}(X,\mu)^{**}\cong L^{p}$

Therefore, $L^p$ is reflexive.

## Questions / Things I do not understand yet

## Final reconstruction

## Previous Week / Next Week

- Previous (reading order): [Seminar 04 — Lp Spaces and Fundamental Inequalities]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %})
- Current: Week 05
- Next (reading order): [Week 06 — Lp Duality — Endpoints and Consequences]({% link _posts/folland-seminar/2026-09-11-folland-week-06-lp-duality-endpoints-and-consequences.md %})
