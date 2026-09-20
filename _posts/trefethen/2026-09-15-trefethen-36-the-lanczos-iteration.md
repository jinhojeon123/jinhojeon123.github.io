---
layout: post
title: "Trefethen 36 — The Lanczos Iteration"
permalink: /study/trefethen/36-the-lanczos-iteration/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, the-lanczos-iteration]
note_type: numerical-method
series: trefethen-nla
series_order: 36
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 36, “The Lanczos Iteration”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement the three-term Lanczos recurrence for Hermitian matrices.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 33 — The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %})
- Background: Hermitian matrices and the Arnoldi relation

## Guiding questions

- Why does the Hermitian assumption reduce Arnoldi to a three-term recurrence?
- Does a short recurrence preserve global orthogonality in floating-point arithmetic?

## Coverage checklist

- [ ] Derivation of the Lanczos tridiagonal relation
- [ ] Exact arithmetic versus loss of orthogonality and ghost Ritz values

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

**Planned target:** `nla::lanczos` in `iterative.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Measure tridiagonal projection, recurrence residuals, and loss of orthogonality in finite precision.

### Metrics

- Lanczos-relation residual and orthogonality of Q
- Tridiagonal structure and Ritz values before and after reorthogonalization

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Failing to check the Hermitian assumption or ignoring ghost Ritz values**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 35 — GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %})
- Next: [Lecture 37 — From Lanczos to Gauss Quadrature]({% link _posts/trefethen/2026-09-15-trefethen-37-from-lanczos-to-gauss-quadrature.md %})
