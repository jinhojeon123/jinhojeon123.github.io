---
layout: post
title: "Trefethen 34 — How Arnoldi Locates Eigenvalues"
permalink: /study/trefethen/34-how-arnoldi-locates-eigenvalues/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, how-arnoldi-locates]
note_type: numerical-method
series: trefethen-nla
series_order: 34
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 34, “How Arnoldi Locates Eigenvalues”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Explain how Arnoldi captures eigenvalues through Ritz values and Krylov polynomials.

## Prerequisites

- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 33 — The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %})
- Background: Ritz pairs and subspace projection

## Guiding questions

- Ritz values are eigenvalues of which small matrix?
- How is a Ritz-vector residual computed in the original space?

## Coverage checklist

- [ ] Recovering Ritz pairs from the Hessenberg projection
- [ ] Distinguishing changes in projected eigenvalues from residuals of the original problem

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

**Planned target:** `experiments/l34_ritz_values.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Visualize Ritz-value trajectories and Ritz residuals across iterations.

### Metrics

- Explicit Ritz-pair residuals compared with the Arnoldi residual formula
- Ritz-value trajectories and orthogonality errors versus basis dimension

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Judging convergence from Ritz-value locations alone**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 33 — The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %})
- Next: [Lecture 35 — GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %})
