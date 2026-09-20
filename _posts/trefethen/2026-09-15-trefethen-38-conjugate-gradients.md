---
layout: post
title: "Trefethen 38 — Conjugate Gradients"
permalink: /study/trefethen/38-conjugate-gradients/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, conjugate-gradients]
note_type: numerical-method
series: trefethen-nla
series_order: 38
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 38, “Conjugate Gradients”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement CG for Hermitian positive definite linear systems and explain energy minimization.

## Prerequisites

- [Lecture 23 — Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %})
- [Lecture 35 — GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %})
- [Lecture 36 — The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %})
- Background: SPD linear systems and the A-inner product

## Guiding questions

- Does CG minimize the residual norm or the A-norm error?
- How does A-conjugacy of search directions appear in the recurrence?

## Coverage checklist

- [ ] Energy minimization over a Krylov subspace
- [ ] Finite termination in exact arithmetic versus floating-point residual drift

## Mathematical development

### Setup and notation

<!-- TODO: Specify dimensions, the scalar field, relevant rank/structure assumptions, and norms. -->

### Definitions and results

<!-- TODO: State the assumptions and conclusions of the main results separately, in your own words. -->

### Derivation and examples

<!-- TODO: Derive the key identity or proof sketch, then add small examples and boundary cases. -->

## Algorithm and cost

<!-- Fill in the procedure for this lecture. Direct methods do not need an artificial iterative stopping criterion. -->

- [ ] Specify input/output dimensions and required assumptions.
- [ ] Derive the main updates and work through a small example by hand.
- [ ] Define stopping/failure conditions or inputs for which the factorization is unavailable.
- [ ] Distinguish operation counts, additional storage, and reusable factorizations.

## C++ implementation plan

**Planned target:** `nla::conjugate_gradient` in `iterative.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Compare the condition number with A-norm error and residual convergence.

### Metrics

- A-norm error for a known solution and the true relative residual
- Iteration counts and termination status versus condition number and spectrum

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Missing handling for non-SPD inputs, residual drift, or the scale of stopping criteria**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 37 — From Lanczos to Gauss Quadrature]({% link _posts/trefethen/2026-09-15-trefethen-37-from-lanczos-to-gauss-quadrature.md %})
- Next: [Lecture 39 — Biorthogonalization Methods]({% link _posts/trefethen/2026-09-15-trefethen-39-biorthogonalization-methods.md %})
