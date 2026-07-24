---
title: "Folland Real Analysis – Chapter 1: Measures"
date: 2026-07-23
categories: [Measure Theory, Real Analysis]
tags: [Folland, measures, sigma-algebra, outer measure, Carathéodory, measurable function]
math: true
---

## Intro

This post is a summary of Chapter 1 of Folland's *Real Analysis*.  
It walks through the basic concepts of measure theory—σ‑algebra, measure, outer measure, Carathéodory's construction, and measurable functions—all in one place.

---

## 1.1 σ‑algebras and Measures

### 1.1.1 σ‑algebra and algebra

A collection $\mathcal{M}\subseteq \mathcal{P}(X)$ on a nonempty set $X$ is a **σ‑algebra** if  
1. $X \in \mathcal{M}$.  
2. $E \in \mathcal{M} \implies E^c \in \mathcal{M}$.  
3. $\{E_j\}_{j=1}^\infty \subseteq \mathcal{M} \implies \bigcup_{j=1}^\infty E_j \in \mathcal{M}$.

The pair $(X,\mathcal{M})$ is a **measurable space**.  

If $\mu$ is a measure on $(X,\mathcal{M})$, then $(X,\mathcal{M},\mu)$ is called a **measure space**.

An **algebra** is a collection $\mathcal{A}\subseteq \mathcal{P}(X)$ closed under **finite** unions and complements. (A σ‑algebra adds closure under countable unions.)

**Lemma 1.1** (Folland). If $\eta \subseteq \mathcal{M}(\mathcal{F})$, then $\mathcal{M}(\eta) \subseteq \mathcal{M}(\mathcal{F})$.

### Measure
A function $\mu : \mathcal{M} \to [0,\infty]$ is a **measure** if  
1. $\mu(\varnothing)=0$.  
2. For any disjoint sequence $\{E_j\}\subseteq\mathcal{M}$,
$$
\mu\Bigl(\bigcup_{j=1}^\infty E_j\Bigr) = \sum_{j=1}^\infty \mu(E_j) \quad\text{(countable additivity)}.
$$

For Instance, suppose that if $\mu(X)=1$, it is a **probability space**.

**Examples**  
- **Counting measure**: $\mu(E) = |E|$ (cardinality).  
- **Dirac measure**: $\delta_a(E)=1$ if $a\in E$, else $0$.  
- **Lebesgue measure** (constructed in §1.3).

### Basic properties
- **Monotonicity**: $A\subseteq B \Rightarrow \mu(A)\le \mu(B)$.
- **Subadditivity**: $\mu(\bigcup_{j=1}^\infty E_j) \le \sum_{j=1}^\infty \mu(E_j)$.
- **Continuity from below**: If $E_1\subseteq E_2\subseteq \cdots$ then $\mu(\bigcup_{j=1}^\infty E_j) = \lim_{j\to\infty}\mu(E_j)$.
- **Continuity from above**: If $E_1\supseteq E_2\supseteq \cdots$ and $\mu(E_1)<\infty$ then $\mu(\bigcap_{j=1}^\infty E_j) = \lim_{j\to\infty}\mu(E_j)$.

**Proof.**  
(You can write a brief proof here or leave it out.)

---

## 1.2 Premeasures, Outer Measures, and the Carathéodory Construction

### 1. Premeasure on an Algebra
- algebra $\mathcal{A}$, premeasure $\mu_0$ 정의, 예시
An premeasure 

### 2. Outer Measure
 
An **outer measure** on $X$ is a function $\mu^* : \mathcal{P}(X) \to [0,\infty]$ such that  
1. $\mu^*(\varnothing)=0$.  
2. $A\subseteq B \Rightarrow \mu^*(A)\le \mu^*(B)$ (monotonicity).  
3. $\mu^*\Bigl(\bigcup_{j=1}^\infty A_j\Bigr) \le \sum_{j=1}^\infty \mu^*(A_j)$ (countable subadditivity).

Outer measures are defined on *all* subsets, but lack countable additivity.

### 3. Carathéodory Outer Measure from a Premeasure

Given a collection $\mathcal{E} \subseteq \mathcal{P}(X)$ with $\varnothing,X\in\mathcal{E}$ and a function $\rho:\mathcal{E}\to[0,\infty]$ with $\rho(\varnothing)=0$, define
$$
\mu^*(A) = \inf\Bigl\{ \sum_{j=1}^\infty \rho(E_j) : E_j\in\mathcal{E},\; A\subseteq \bigcup_{j=1}^\infty E_j \Bigr\}.
$$
Then $\mu^*$ is an outer measure.

---

 
### 4. $\mu^*$-measurable Sets

A set $A\subseteq X$ is **$\mu^*$-measurable** if for every $E\subseteq X$,
$$
\mu^*(E) = \mu^*(E\cap A) + \mu^*(E\cap A^c).
$$


### 5. Carathéodory Extension Theorem


**Carathéodory’s Theorem**  
Let $\mu^*$ be an outer measure on $X$. Then the collection $\mathcal{M}$ of all $\mu^*$-measurable sets is a σ‑algebra, and the restriction $\mu = \mu^*|_{\mathcal{M}}$ is a complete measure (every subset of a null set is measurable).

**Proof.**  
(You can insert the main idea or a detailed proof here.)



## 1.3. Lebesgue–Stieltjes measure
Take $X=\mathbb{R}$, $\mathcal{E} = \{(a,b] : a<b\}$, and a right‑continuous increasing function $F$. Define $\rho((a,b]) = F(b)-F(a)$. The outer measure obtained from $\rho$ yields the **Lebesgue–Stieltjes measure** associated to $F$.  
- If $F(x)=x$, we obtain **Lebesgue measure** $m$.

**Properties of Lebesgue measure**  
- Translation invariance: $m(E+t)=m(E)$.  
- Scaling: $m(cE)=|c|m(E)$.  
- Regularity.

---

## 1.4. algebraic structure and its equivalence class and others. 

A collection $\mathcal{A}$ of $\mathcal{P}(X)$ is called a **ring** if it is closed under finite unions and differences. A ring that is closed under countable unions is called a **$\sigma$-ring**. 

## Summary – What We Built in Chapter 1

1. **σ‑algebra & measure** – We established the definitions of measurability and measure.
2. **Outer measure** – We introduced a subadditive set function defined on all subsets.
3. **Carathéodory’s Theorem** – We learned the standard method for constructing a complete measure from an outer measure.
4. **Lebesgue–Stieltjes measure** – We obtained a general construction of measures on the real line, in particular recovering Lebesgue measure.
5. **Measurable functions** – We summarized the rich properties of functions that preserve the measure structure, including approximation by simple functions.

## Next Steps
- **Chapter 2 – Integration**  
  Starting from the integral of simple functions, we will develop the general integration theory.
- **Exercises to Try**  
  - Verify that sets satisfying the Carathéodory condition indeed form a σ‑algebra.  
  - Compute the Lebesgue measure of the Cantor set.  
  - Compare various families that generate the Borel σ‑algebra $\mathcal{B}_\mathbb{R}$.

Now the skeleton of Chapter 1 is complete.  
Familiarizing yourself with this structure will be a great help before moving on to the integration chapter. 🚀