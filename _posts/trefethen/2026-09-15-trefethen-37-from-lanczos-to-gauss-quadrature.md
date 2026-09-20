---
layout: post
title: "Trefethen 37 — From Lanczos to Gauss Quadrature"
permalink: /study/trefethen/37-from-lanczos-to-gauss-quadrature/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, from-lanczos-to]
note_type: numerical-method
series: trefethen-nla
series_order: 37
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 37, “From Lanczos to Gauss Quadrature”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Reconstruct the connection between Lanczos projection and Gauss quadrature numerically.

## Prerequisites

- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 36 — The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %})
- Background: Hermitian spectral decomposition and polynomial integration

## Guiding questions

- How does the small Lanczos tridiagonal matrix determine quadrature nodes and weights?
- How does polynomial exactness differ from approximation error for a general function?

## Coverage checklist

- [ ] The connection between spectral measures and bilinear forms
- [ ] Assumptions and derivation of the exactness range of Gauss quadrature

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

**Planned target:** `experiments/l37_gauss_quadrature.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Record bilinear-form or integral-estimate errors across iterations.

### Metrics

- Comparison with an exact spectral sum for a small Hermitian problem
- Quadrature error versus polynomial degree and number of Lanczos steps

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Failing to check function smoothness and the spectral interval**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 36 — The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %})
- Next: [Lecture 38 — Conjugate Gradients]({% link _posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md %})
