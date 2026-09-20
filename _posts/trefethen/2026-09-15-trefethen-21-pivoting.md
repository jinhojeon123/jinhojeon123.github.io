---
layout: post
title: "Trefethen 21 — Pivoting"
permalink: /study/trefethen/21-pivoting/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, pivoting]
note_type: numerical-method
series: trefethen-nla
series_order: 21
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 21, “Pivoting”
- **Part:** **IV — Systems of Equations**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement partial pivoting and permutation bookkeeping.

## Prerequisites

- [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
- [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
- Background: Permutation matrices and row interchanges

## Guiding questions

- Does the implementation use PA=LU or A=PLU?
- Which previously computed entries of L must move in the kth row interchange?

## Coverage checklist

- [ ] The partial-pivoting selection rule
- [ ] Consistent permutation conventions across factorization and solution

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

**Planned target:** `nla::lu_factor_partial_pivoting` in `systems.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Compare elimination with and without partial pivoting on matrices with a small first pivot.

### Metrics

- Relative Frobenius norm of PA−LU
- Backward error for small-pivot examples and verification of row interchanges

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Incorrect permutation direction, swaps of previously computed columns of L, or pivot indices**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
- Next: [Lecture 22 — Stability of Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-22-stability-of-gaussian-elimination.md %})
