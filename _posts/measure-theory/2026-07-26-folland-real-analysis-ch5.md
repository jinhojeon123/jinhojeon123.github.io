---
title: "Folland Real Analysis – Chapter 5: Elements of Functional Analysis"
date: 2026-07-24
categories: [Measure Theory, Real Analysis, Functional Analysis]
tags: [Folland, Banach space, Hilbert space, dual space, Baire category, orthonormal basis]
math: true
---

## Intro

Chapter 5 of Folland builds the foundational language of functional analysis needed for later chapters: normed vector spaces, linear functionals, the Baire category theorem and its powerful consequences, topological vector spaces, and Hilbert spaces. The chapter culminates with the theory of orthonormal bases and the elegant equivalent characterisations of completeness.

---

## 5.1 Normed Vector Spaces

A **normed vector space** is a vector space $X$ over $\mathbb{R}$ or $\mathbb{C}$ equipped with a norm $\|\cdot\|$ satisfying

*   $\|x\| \ge 0$, and $\|x\|=0$ iff $x=0$,
*   $\|\lambda x\| = |\lambda| \|x\|$,
*   $\|x+y\| \le \|x\| + \|y\|$.

A norm induces a metric $d(x,y)=\|x-y\|$ and hence a topology. A **Banach space** is a normed vector space that is complete in this metric.

**Examples**  
- $L^p(\mu)$ for $1 \le p \le \infty$ are Banach spaces.  
- $\ell^p$ spaces (sequences) and $C([a,b])$ with the supremum norm.  
- Any finite‑dimensional normed space is a Banach space; all norms are equivalent.

---

## 5.2 Linear Functionals

A **linear functional** on a normed space $X$ is a linear map $f: X \to \mathbb{C}$ (or $\mathbb{R}$).  
It is **bounded** if $\|f\| = \sup_{\|x\|=1} |f(x)| < \infty$. The collection of all bounded linear functionals forms the **dual space** $X^*$, which is a Banach space with the operator norm.

**Examples**  
- For $1<p<\infty$, the dual of $L^p$ is $L^q$ with $1/p+1/q=1$.  
- The Riesz representation theorem for Hilbert spaces: every continuous linear functional on a Hilbert space is an inner product with a fixed vector.

The **Hahn–Banach theorem** (treated later or in an appendix) guarantees the existence of non‑trivial bounded linear functionals and allows separating points from closed subspaces.

---

## 5.3 Baire Category Theorem and Its Consequences

### Baire Category Theorem
A complete metric space cannot be written as a countable union of nowhere dense sets. Equivalently, the intersection of countably many dense open sets is dense.

This purely topological result has profound consequences in functional analysis.

**1. Uniform Boundedness Principle (Banach–Steinhaus)**  
If $\{T_\alpha\}$ is a family of bounded linear operators from a Banach space $X$ to a normed space $Y$ such that $\sup_\alpha \|T_\alpha x\| < \infty$ for each fixed $x \in X$, then $\sup_\alpha \|T_\alpha\| < \infty$.  
*Proof sketch:* The sets $E_n = \{x : \sup_\alpha \|T_\alpha x\| \le n\}$ are closed and their union is $X$, so by Baire one $E_n$ has nonempty interior, giving a uniform bound.

**2. Open Mapping Theorem**  
A surjective bounded linear map between Banach spaces is open. Consequently, a bijective bounded linear map has a bounded inverse.

**3. Closed Graph Theorem**  
If $X$ and $Y$ are Banach spaces and $T: X \to Y$ is linear with a closed graph ($x_n \to 0$, $Tx_n \to y \Rightarrow y=0$), then $T$ is bounded.  
This is an essential tool for verifying boundedness without explicit estimates.

---

## 5.4 Topological Vector Spaces

A **topological vector space (TVS)** is a vector space equipped with a topology such that addition and scalar multiplication are continuous. Normed spaces are a special case, but the TVS framework is needed for topologies like the weak and weak‑$*$ topologies on dual spaces.

**Seminorms and local bases**  
A family of seminorms $\{\rho_\alpha\}$ defines a (locally convex) TVS topology: basic open neighbourhoods of $0$ are sets where finitely many $\rho_\alpha$ are less than $\varepsilon$. The topology is Hausdorff iff the seminorms separate points. A TVS is **normable** precisely when its topology can be defined by a single norm.

Examples include the weak topology $\sigma(X,X^*)$ (the coarsest topology making all $f\in X^*$ continuous) and the weak‑$*$ topology $\sigma(X^*,X)$.

---

## 5.5 Hilbert Space

A **Hilbert space** $H$ is an inner product space $\langle\cdot,\cdot\rangle$ that is complete in the induced norm $\|x\| = \sqrt{\langle x,x\rangle}$. The inner product gives a natural isomorphism between $H$ and its dual (Riesz representation).

### Orthonormal sets and bases
A set $\{e_\alpha\}_{\alpha\in A} \subset H$ is **orthonormal** if $\langle e_\alpha, e_\beta\rangle = \delta_{\alpha\beta}$.

**Bessel’s inequality:** For any $x \in H$ and any orthonormal set $\{e_\alpha\}$,
$$
\sum_\alpha |\langle x, e_\alpha\rangle|^2 \le \|x\|^2.
$$
In particular, only countably many Fourier coefficients $\langle x, e_\alpha\rangle$ are non‑zero.

### Equivalent characterisations of an orthonormal basis

For an orthonormal set $\{e_\alpha\}$ in a Hilbert space $H$, the following are equivalent:

1. **Completeness:** $\{e_\alpha\}$ is a maximal orthonormal set (no vector can be added without destroying orthonormality).  
2. **Parseval’s identity:** For all $x \in H$, $\sum_\alpha |\langle x, e_\alpha\rangle|^2 = \|x\|^2$.  
3. **Unconditional convergence of the Fourier series:** For every $x$, the series $\sum_\alpha \langle x, e_\alpha\rangle e_\alpha$ converges to $x$ **in the norm topology**, and the sum is independent of the ordering of the terms (i.e., it converges unconditionally).  

Such a set is called an **orthonormal basis** (or Hilbert basis). Using Zorn’s lemma, every Hilbert space admits an orthonormal basis. All orthonormal bases of a given Hilbert space have the same cardinality, the **Hilbert dimension**.

The unconditional convergence in (c) is crucial: it means that any rearrangement of the series still converges to $x$, a phenomenon that does not occur in general Banach spaces.

---

## Summary – Chapter 5

1. **Normed spaces and Banach spaces** lay the metric groundwork.  
2. **Linear functionals and dual spaces** prepare the duality theory used throughout analysis.  
3. The **Baire Category Theorem** yields the Uniform Boundedness Principle, the Open Mapping Theorem, and the Closed Graph Theorem – the “three pillars” of functional analysis.  
4. **Topological vector spaces** extend these ideas to non‑normable topologies (weak, weak‑$*$).  
5. **Hilbert spaces** add an inner product and give us orthonormal bases, Bessel’s inequality, and the equivalent characterisations of completeness, Parseval’s identity, and unconditional convergence of Fourier series.

With Chapter 5 complete, one is well‑equipped for the duality and operator theory that follow in the later chapters of Folland.