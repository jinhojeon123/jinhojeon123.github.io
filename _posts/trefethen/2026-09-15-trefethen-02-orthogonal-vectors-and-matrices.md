---
layout: post
title: "Trefethen 02 — Orthogonal Vectors and Matrices"
permalink: /study/trefethen/02-orthogonal-vectors-and-matrices/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, orthogonal-vectors-and]
note_type: numerical-method
series: trefethen-nla
series_order: 2
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 2, “Orthogonal Vectors and Matrices”
- **Part:** **I — Fundamentals**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Use code to explore complex inner products, the conjugate transpose, and the geometry of orthogonal and unitary matrices.

## Prerequisites

- [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %})
- Background: Complex conjugation and inner products

## Guiding questions

- How are real orthogonal matrices related to complex unitary matrices?
- For a rectangular Q with orthonormal columns, what do $Q^{\ast}Q$ and $QQ^{\ast}$ represent?

## Coverage checklist

- [ ] Conventions for the conjugate transpose and complex inner product
- [ ] Derivation of inner-product and 2-norm preservation under unitary transformations

## Mathematical development

### Setup and notation

<!-- TODO: Specify dimensions, the scalar field, relevant rank/structure assumptions, and norms. -->

### Definitions and results

<!-- TODO: State the assumptions and conclusions of the main results separately, in your own words. -->

### Derivation and examples

<!-- TODO: Derive the key identity or proof sketch, then add small examples and boundary cases. -->

## C++ verification plan

Use small computations to illustrate the definitions and results in this theory lecture.
Add a new solver implementation only when it serves the topic.

**Planned target:** `nla::orthogonality_error` and a unitary-invariance experiment

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Apply unitary transformations to random vectors and measure preservation of inner products and 2-norms.

### Metrics

- Frobenius norm of $Q^{\ast}Q-I$
- Changes in inner products and vector 2-norms after transformation

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Confusing `transpose()` with `adjoint()`**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %})
- Next: [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
