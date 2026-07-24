---
title: "Folland Real Analysis – Chapter 6: L^p Spaces"
date: 2026-07-24
categories: [Measure Theory, Real Analysis]
tags: [Folland, Lp spaces, duality, interpolation, inequalities, weak Lp]
math: true
---

## Intro

Chapter 6 of Folland develops the theory of $L^p$ spaces: completeness, duality, inequalities, and interpolation. We start from basic definitions and work up to the powerful Marcinkiewicz interpolation theorem, with a careful look at what "dual" really means for $L^\infty$.

---

## 6.1 Basic Theory of $L^p$ Spaces

For a measure space $(X,\mathcal{M},\mu)$ and $0 < p < \infty$,  
$$
\|f\|_p = \left( \int |f|^p \, d\mu \right)^{1/p}
$$
defines a complete norm when $p \ge 1$; for $0<p<1$, $L^p$ is a complete metric space with $d(f,g)=\|f-g\|_p^p$.

**$L^\infty$ space**  
$$
\|f\|_\infty = \inf\{ a \ge 0 : \mu(\{x: |f(x)| > a\}) = 0 \},
$$
the essential supremum. $(L^\infty, \|\cdot\|_\infty)$ is a Banach space.

**Key facts**  
- Simple functions are dense in $L^p$ for $p<\infty$.  
- Hölder’s inequality: $\|fg\|_1 \le \|f\|_p \|g\|_q$ when $1/p+1/q=1$.  
- Minkowski’s inequality: $\|f+g\|_p \le \|f\|_p + \|g\|_p$ for $p\ge 1$.

---

## 6.2 The Duals of $L^p$

### What is the “dual”?

The dual of a normed space $X$ is the space of all bounded linear functionals $\varphi: X \to \mathbb{C}$ (or $\mathbb{R}$), with the operator norm $\|\varphi\| = \sup_{\|x\|=1} |\varphi(x)|$. For $L^p$, the dual is usually identified with an $L^q$ space via the pairing  
$$
\varphi_g(f) = \int f g \, d\mu,
$$
which is a bounded linear functional when $g \in L^q$ ($1/p+1/q=1$). The question is whether **every** bounded linear functional arises this way.

### The standard duality theorem

Assume $(X,\mathcal{M},\mu)$ is $\sigma$-finite (or a general measure space with some care).  

- **For $1 < p < \infty$:**  
  $(L^p)^* \cong L^q$ isometrically, where $1/p+1/q=1$.  
  Every bounded linear functional on $L^p$ is of the form $f \mapsto \int f g \, d\mu$ for a unique $g \in L^q$.

- **For $p=1$:**  
  $(L^1)^* \cong L^\infty$ under the $\sigma$-finite assumption.  
  Again, every functional is integration against an $L^\infty$ function.

- **For $p=\infty$:**  
  The situation is **subtle**.  
  $(L^\infty)^*$ is **not** $L^1$ in general. The dual of $L^\infty$ is the space of **finitely additive measures** absolutely continuous with respect to $\mu$ (or, on a $\sigma$-algebra, it’s the space of bounded, finitely additive signed measures).  
  Only under very restrictive conditions (e.g., $X$ is a finite set with counting measure) does $(L^\infty)^* \cong L^1$.  
  This is a crucial nuance: the pairing with $L^1$ yields only a closed subspace of the dual, namely the space of *countably additive* measures. The full dual is larger and contains functionals that cannot be represented by an $L^1$ function.

---

## 6.3 Some Useful Inequalities

### Chebyshev’s Inequality
For $f \in L^p$, $p>0$, and any $\alpha > 0$,
$$
\mu(\{x : |f(x)| > \alpha\}) \le \frac{\|f\|_p^p}{\alpha^p}.
$$
This is a direct consequence of $\int |f|^p \ge \alpha^p \mu(\{|f|>\alpha\})$.

### Minkowski’s Inequality for Integrals
Let $(X,\mathcal{M},\mu)$ and $(Y,\mathcal{N},\nu)$ be $\sigma$-finite, and $f$ a measurable function on $X \times Y$. For $1 \le p < \infty$,
$$
\left[ \int \left( \int |f(x,y)| \, d\nu(y) \right)^p d\mu(x) \right]^{1/p}
\le \int \left( \int |f(x,y)|^p \, d\mu(x) \right)^{1/p} d\nu(y).
$$
In norm notation: $\| \int f(\cdot,y) \, d\nu(y) \|_p \le \int \|f(\cdot,y)\|_p \, d\nu(y)$.  
*Interpretation:* The $L^p$ norm of an integral is at most the integral of the $L^p$ norms.

### Hardy’s Inequality
For $1 < p < \infty$ and a nonnegative measurable function $f$ on $(0,\infty)$,
$$
\int_0^\infty \left( \frac{1}{x} \int_0^x f(t) \, dt \right)^p dx
\le \left( \frac{p}{p-1} \right)^p \int_0^\infty f(x)^p \, dx.
$$
Similarly, for the adjoint averaging operator $\frac{1}{x} \int_x^\infty f(t) \, dt$, the constant changes to $\left( \frac{p}{p-1} \right)^p$ as well. Hardy’s inequality is a fundamental tool in analysis.

### Hilbert’s Inequality
The discrete version: For sequences $\{a_m\}, \{b_n\}$,
$$
\sum_{m,n} \frac{a_m b_n}{m+n} \le \frac{\pi}{\sin(\pi/p)} \|a\|_p \|b\|_q,\quad 1/p+1/q=1,\; p,q>1.
$$
A continuous analogue: $\int_0^\infty \int_0^\infty \frac{f(x)g(y)}{x+y} \, dx \, dy$ satisfies a similar bound with constant $\frac{\pi}{\sin(\pi/p)}$. The sharp constant is derived from the beta function.

### Generalized Hölder Inequality
If $p_1,\dots,p_n > 0$ and $\sum 1/p_j = 1/r$, then for measurable $f_j$,
$$
\|f_1 f_2 \cdots f_n\|_r \le \|f_1\|_{p_1} \|f_2\|_{p_2} \cdots \|f_n\|_{p_n}.
$$
The usual Hölder is the case $n=2$, $r=1$. This is proved by induction and standard Hölder.

---

## 6.4 Distribution Functions and Weak $L^p$

### Distribution function
For a measurable function $f$, its distribution function is
$$
\lambda_f(\alpha) = \mu(\{x : |f(x)| > \alpha\}), \quad \alpha > 0.
$$
Then $\|f\|_p^p = p \int_0^\infty \alpha^{p-1} \lambda_f(\alpha) \, d\alpha$ (layer‑cake representation).

### Weak $L^p$ spaces
For $0 < p < \infty$, the weak $L^p$ space $L^{p,\infty}(\mu)$ consists of measurable $f$ such that
$$
\sup_{\alpha > 0} \alpha^p \lambda_f(\alpha) < \infty.
$$
Define $\|f\|_{p,\infty} = \sup_{\alpha>0} \alpha \, \lambda_f(\alpha)^{1/p}$ (a quasinorm). For $p>1$ it is equivalent to a norm. Weak $L^p$ is larger than $L^p$; e.g., $f(x)=|x|^{-n/p}$ on $\mathbb{R}^n$ belongs to $L^{p,\infty}$ but not to $L^p$.

---

## 6.5 Interpolation of $L^p$ Spaces

### Three Lines Lemma
A function $F$ holomorphic on the strip $0 < \operatorname{Re} z < 1$, continuous and bounded on the closed strip, with $|F(iy)| \le M_0$ and $|F(1+iy)| \le M_1$ for all real $y$, satisfies
$$
|F(\theta + iy)| \le M_0^{1-\theta} M_1^\theta, \quad 0 \le \theta \le 1.
$$
This is a consequence of the maximum modulus principle applied to a clever auxiliary function.

### Riesz–Thorin Interpolation Theorem
Let $1 \le p_0, p_1, q_0, q_1 \le \infty$, and $T$ a linear operator bounded from $L^{p_0} \to L^{q_0}$ and $L^{p_1} \to L^{q_1}$ with norms $M_0, M_1$. For $0 < \theta < 1$, define
$$
\frac{1}{p} = \frac{1-\theta}{p_0} + \frac{\theta}{p_1}, \qquad
\frac{1}{q} = \frac{1-\theta}{q_0} + \frac{\theta}{q_1}.
$$
Then $T$ extends to a bounded operator $L^p \to L^q$ with norm $\le M_0^{1-\theta} M_1^\theta$.  
This is **complex interpolation** and relies on the Three Lines Lemma applied to $\int (T f_z) g_z$.

### Strong type and weak type
An operator $T$ (not necessarily linear) is of **strong type $(p,q)$** if $\|Tf\|_q \le C \|f\|_p$ for all $f \in L^p$.  
It is of **weak type $(p,q)$** ($q<\infty$) if
$$
\lambda_{Tf}(\alpha) \le \left( \frac{C \|f\|_p}{\alpha} \right)^q,
$$
i.e., $T$ maps $L^p$ into $L^{q,\infty}$ boundedly.

### Marcinkiewicz Interpolation Theorem
Let $1 \le p_0 < p_1 \le \infty$ and $1 \le q_0 \neq q_1 \le \infty$. Suppose $T$ is a sublinear operator (e.g., $|T(f+g)| \le |Tf| + |Tg|$) that is simultaneously of weak types $(p_0,q_0)$ and $(p_1,q_1)$. Then for any $0<\theta<1$, $T$ is of **strong type $(p,q)$** where
$$
\frac{1}{p} = \frac{1-\theta}{p_0} + \frac{\theta}{p_1}, \qquad
\frac{1}{q} = \frac{1-\theta}{q_0} + \frac{\theta}{q_1}.
$$
This is real interpolation, proven by splitting $f$ into small and large parts via distribution functions. It does **not** require linearity, only sublinearity, and is remarkably robust.

---

## Summary – Chapter 6

1. $L^p$ spaces are Banach spaces for $p\ge 1$, complete metric spaces for $p<1$.  
2. The dual of $L^p$ is $L^q$ for $1 \le p < \infty$ ($p=1$ needs $\sigma$-finiteness); for $p=\infty$, the dual is the finitely additive measures.  
3. Essential inequalities: Chebyshev, Minkowski integral inequality, Hardy, Hilbert, generalized Hölder.  
4. Weak $L^p$ spaces are defined via distribution functions and are crucial for endpoint estimates.  
5. Interpolation: Riesz–Thorin (complex) and Marcinkiewicz (real) allow deducing strong type bounds from weak endpoint estimates, with many applications in harmonic analysis.

With these tools, one can tackle a vast array of problems in analysis and PDEs.