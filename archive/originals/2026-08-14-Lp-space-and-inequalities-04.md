---
title: "Measure Theory Seminar 04 – $L^p$ Spaces and Fundamental Inequalities"
date: 2026-08-14 00:00:00 +0900

categories:
  - Seminar
  - Measure Theory Seminar

tags:
  - lp-spaces
  - young-inequality
  - holder-inequality
  - minkowski-inequality
  - banach-space
  - hilbert-space

description: "Introduction to $L^p$ spaces, Young's inequality, Hölder's inequality, Minkowski's inequality, relations between $L^p$ spaces, and their basic Banach and Hilbert space structure."

math: true
---

## **Roadmap**

1. From Lebesgue Integration to $L^p$
2. Definition and Basic Structure of $L^p$
3. Young's Inequality
4. Hölder's Inequality
5. Minkowski's Inequality
6. Relations Between $L^p$ Spaces
7. Examples and Counterexamples
8. Completeness of $L^p$
9. Why $L^2$ Is Special
10. Where $L^p$ Goes Next


---

## **1. From Lebesgue Integration to $L^p$**

### **1.1 What Did $L^1$ Measure?**

### **1.2 Why Consider $|f|^p$?**

### **1.3 How Does $p$ Change the Notion of Size?**

### **1.4 From Integrability to Function Spaces**


---

## **2. $L^p$ Spaces**

### **2.1 Definition for $1 \le p < \infty$**

For a measure space $(X,\mathcal{M},\mu)$,

$$
\mathcal{L}^p(X)
=
\left\{
f :X\to\mathbb{R}
\text{ measurable}:
\int_X |f|^p\,d\mu<\infty
\right\}.
$$

Define

$$
\|f\|_p
=
\left(
\int_X |f|^p\,d\mu
\right)^{1/p}.
$$


### **2.2 The Case $p=\infty$**

### **2.3 Essential Supremum**

### **2.4 Equality Almost Everywhere**

### **2.5 Why We Need Equivalence Classes**

If

$$
\|f\|_p=0,
$$

then only

$$
f=0
\qquad\text{a.e.}
$$

is guaranteed.

Therefore, functions that are equal almost everywhere are identified with each other.


### **2.6 The Space $L^p$**

### **2.7 Basic Properties of the $L^p$-Norm**

### **2.8 First Examples: $L^1$, $L^2$, and $L^\infty$**


---

## **3. Young's Inequality**

### **3.1 Conjugate Exponents**

Let

$$
1<p<\infty.
$$

The conjugate exponent $q$ is defined by

$$
\frac{1}{p}+\frac{1}{q}=1.
$$

Equivalently,

$$
q=\frac{p}{p-1}.
$$


### **3.2 Statement of Young's Inequality**

For $a,b\ge0$,

$$
ab
\le
\frac{a^p}{p}
+
\frac{b^q}{q}.
$$


### **3.3 Proof**

### **3.4 Equality Case**

### **3.5 Why Young's Inequality Matters**

Young's inequality gives a pointwise estimate that will be integrated in the proof of Hölder's inequality.


---

## **4. Hölder's Inequality**

### **4.1 Statement**

Let

$$
\frac1p+\frac1q=1.
$$

If

$$
f\in L^p(X),
\qquad
g\in L^q(X),
$$

then

$$
fg\in L^1(X)
$$

and

$$
\boxed{
\|fg\|_1
\le
\|f\|_p\|g\|_q
}.
$$


### **4.2 The Normalization Idea**

Consider

$$
\frac{|f|}{\|f\|_p}
\qquad\text{and}\qquad
\frac{|g|}{\|g\|_q}.
$$


### **4.3 Proof Using Young's Inequality**

### **4.4 Endpoint Case: $p=1,\ q=\infty$**

### **4.5 Cauchy–Schwarz as the Case $p=q=2$**

When

$$
p=q=2,
$$

Hölder becomes

$$
\int_X |fg|\,d\mu
\le
\|f\|_2\|g\|_2.
$$


### **4.6 Product Integrability**

Interpret Hölder as

$$
L^p\times L^q
\longrightarrow
L^1.
$$


### **4.7 Equality Case**

### **4.8 Why Hölder Is Important**


---

## **5. Minkowski's Inequality**

### **5.1 Statement**

For $1\le p\le\infty$,

$$
\boxed{
\|f+g\|_p
\le
\|f\|_p+\|g\|_p
}.
$$


### **5.2 The Easy Case $p=1$**

### **5.3 The Case $1<p<\infty$**

Start from

$$
|f+g|^p
=
|f+g|\,|f+g|^{p-1}.
$$

Using

$$
|f+g|
\le
|f|+|g|,
$$

we obtain

$$
|f+g|^p
\le
|f||f+g|^{p-1}
+
|g||f+g|^{p-1}.
$$


### **5.4 Applying Hölder's Inequality**

### **5.5 Why the Conjugate Exponent Appears**

For

$$
q=\frac{p}{p-1},
$$

we have

$$
(p-1)q=p.
$$


### **5.6 Completion of the Proof**

### **5.7 Minkowski as the Triangle Inequality**

### **5.8 Conclusion: $L^p$ Is a Normed Vector Space**


---

## **6. Relations Between $L^p$ Spaces**

### **6.1 Does Larger $p$ Mean a Smaller Space?**

### **6.2 The Finite Measure Case**

Assume

$$
\mu(X)<\infty
$$

and

$$
1\le p<q\le\infty.
$$


### **6.3 The Inclusion $L^q(X)\subset L^p(X)$**

### **6.4 Proof Using Hölder's Inequality**

### **6.5 Norm Estimate**

We obtain

$$
\boxed{
\|f\|_p
\le
\mu(X)^{\frac1p-\frac1q}
\|f\|_q
}.
$$


### **6.6 Why the Finite Measure Assumption Matters**

### **6.7 What Happens on Infinite Measure Spaces?**


---

## **7. Examples and Counterexamples**

### **7.1 Power Functions Near Zero**

Consider

$$
f(x)=x^{-\alpha},
\qquad x\in(0,1).
$$

Then

$$
f\in L^p(0,1)
$$

if and only if

$$
\alpha p<1.
$$


### **7.2 Power Functions Near Infinity**

Consider

$$
f(x)=x^{-\alpha},
\qquad x\in(1,\infty).
$$

Then

$$
f\in L^p(1,\infty)
$$

if and only if

$$
\alpha p>1.
$$


### **7.3 A Function in $L^p$ but Not in $L^q$**

### **7.4 A Function in $L^q$ but Not in $L^p$**

### **7.5 Why There Is No Universal Inclusion on $\mathbb{R}$**

### **7.6 Comparing $L^1$, $L^2$, and $L^\infty$**


---

## **8. Completeness of $L^p$**

### **8.1 Normed Spaces and Cauchy Sequences**

A sequence $\{f_n\}$ in a normed space is Cauchy if

$$
\forall \varepsilon>0,
\quad
\exists N
\quad\text{such that}\quad
m,n\ge N
\implies
\|f_n-f_m\|<\varepsilon.
$$


### **8.2 Complete Normed Spaces**

A normed vector space is called **complete** if every Cauchy sequence converges to an element of the space.

A complete normed vector space is called a **Banach space**.


### **8.3 Completeness Theorem for $L^p$**

For

$$
1\le p\le\infty,
$$

the space $L^p(X)$ is complete.

Hence,

$$
\boxed{
L^p(X)\text{ is a Banach space}.
}
$$


### **8.4 Start with an $L^p$-Cauchy Sequence**

Let

$$
\{f_n\}
$$

be Cauchy in $L^p$.


### **8.5 Choosing a Rapidly Convergent Subsequence**

Choose a subsequence

$$
\{f_{n_k}\}
$$

such that

$$
\|f_{n_{k+1}}-f_{n_k}\|_p
<
2^{-k}.
$$


### **8.6 Constructing an Auxiliary Sequence**

Define

$$
g_m
=
\sum_{k=1}^{m}
|f_{n_{k+1}}-f_{n_k}|.
$$


### **8.7 Control Using Minkowski's Inequality**

By Minkowski,

$$
\|g_m\|_p
\le
\sum_{k=1}^{m}
\|f_{n_{k+1}}-f_{n_k}\|_p.
$$

Hence,

$$
\|g_m\|_p
<
\sum_{k=1}^{m}2^{-k}
\le1.
$$


### **8.8 Passing to the Limit**

Since

$$
0\le g_1\le g_2\le\cdots,
$$

define

$$
g
=
\lim_{m\to\infty}g_m
=
\sum_{k=1}^{\infty}
|f_{n_{k+1}}-f_{n_k}|.
$$


### **8.9 Using the Previous Convergence Theorems**

Use MCT / Fatou to show

$$
g\in L^p.
$$

Therefore,

$$
g(x)<\infty
\qquad\text{for a.e. }x.
$$


### **8.10 Pointwise Almost Everywhere Convergence**

For almost every $x$,

$$
\sum_{k=1}^{\infty}
|f_{n_{k+1}}(x)-f_{n_k}(x)|
<
\infty.
$$

Hence

$$
\{f_{n_k}(x)\}
$$

is Cauchy in $\mathbb{R}$ for almost every $x$.

Define

$$
f(x)
=
\lim_{k\to\infty}f_{n_k}(x)
$$

where the limit exists.


### **8.11 Convergence in $L^p$**

Show that

$$
f_{n_k}\to f
\qquad\text{in }L^p.
$$


### **8.12 Returning to the Original Cauchy Sequence**

Since $\{f_n\}$ was Cauchy and a subsequence converges to $f$,

$$
f_n\to f
\qquad\text{in }L^p.
$$


### **8.13 Conclusion**

Therefore,

$$
\boxed{
L^p(X)\text{ is complete}.
}
$$

Hence $L^p(X)$ is a Banach space.


---

## **9. Why $L^2$ Is Special**

### **9.1 Inner Product Spaces**

An inner product provides more structure than a norm.


### **9.2 The $L^2$ Inner Product**

For real-valued functions,

$$
\langle f,g\rangle_{L^2}
=
\int_X fg\,d\mu.
$$

For complex-valued functions,

$$
\langle f,g\rangle_{L^2}
=
\int_X f\overline{g}\,d\mu.
$$


### **9.3 The Norm Induced by the Inner Product**

$$
\|f\|_2
=
\sqrt{\langle f,f\rangle_{L^2}}.
$$


### **9.4 Hilbert Spaces**

A complete inner product space is called a **Hilbert space**.

Since $L^2$ is complete,

$$
\boxed{
L^2(X)\text{ is a Hilbert space}.
}
$$


### **9.5 Banach vs. Hilbert**

Every Hilbert space is a Banach space with respect to its induced norm, but not every Banach space is a Hilbert space.


### **9.6 Why $L^2$ Will Matter Later**


---

## **10. Where $L^p$ Goes Next**

### **10.1 Measuring Functions**

In $L^p$, we measure the size of a function through

$$
\|u\|_p.
$$


### **10.2 What If We Also Want to Measure Derivatives?**

For PDEs, controlling only $u$ is often not enough.

We would also like to control quantities such as

$$
D_i u.
$$


### **10.3 Weak Derivatives**

Classical differentiability will turn out to be too restrictive.

This motivates the notion of a **weak derivative**.


### **10.4 Preview of Sobolev Spaces**

Very roughly,

$$
W^{1,p}(\Omega)
=
\left\{
u\in L^p(\Omega)
:
D_i u\in L^p(\Omega)
\right\}.
$$

In particular,

$$
H^1(\Omega)
=
W^{1,2}(\Omega).
$$


### **10.5 Next Seminar**

- Normed, Banach, and Hilbert spaces
- Linear operators and linear functionals
- Closure and density
- Functional analysis tools needed for Sobolev spaces and PDEs


---

## **Summary**

The main logical structure of this seminar is

$$
\boxed{
L^p
\longrightarrow
\text{Young}
\longrightarrow
\text{Hölder}
\longrightarrow
\text{Minkowski}
\longrightarrow
L^p\text{ relations}
\longrightarrow
\text{Banach structure}
}
$$

Young's inequality provides the pointwise estimate behind Hölder's inequality.

Hölder's inequality controls products:

$$
L^p\times L^q
\longrightarrow
L^1.
$$

Minkowski's inequality provides the triangle inequality:

$$
\|f+g\|_p
\le
\|f\|_p+\|g\|_p.
$$

Thus $L^p$ becomes a normed vector space.

Furthermore,

$$
\boxed{
L^p\text{ is Banach for }1\le p\le\infty.
}
$$

The case $p=2$ has additional inner-product structure:

$$
\boxed{
L^2\text{ is a Hilbert space}.
}
$$

This provides the basic language needed for the next step:

$$
\boxed{
L^p
\longrightarrow
\text{Functional Analysis}
\longrightarrow
\text{Weak Derivatives}
\longrightarrow
\text{Sobolev Spaces}
\longrightarrow
\text{PDE}.
}
$$