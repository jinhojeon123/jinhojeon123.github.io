---
layout: post
title: "Trefethen 27 — Rayleigh Quotient, Inverse Iteration"
permalink: /study/trefethen/27-rayleigh-quotient-inverse-iteration/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, rayleigh-quotient-inverse]
note_type: numerical-method
series: trefethen-nla
series_order: 27
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 27, “Rayleigh Quotient, Inverse Iteration”
- **Part:** **V — Eigenvalues**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement inverse iteration and Rayleigh quotient iteration.

## Prerequisites

- [Lecture 17 — Stability of Back Substitution]({% link _posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md %})
- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 25 — Overview of Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-25-overview-of-eigenvalue-algorithms.md %})
- Background: Shifted linear systems and normalization

## Guiding questions

- How does the inverse-iteration shift affect the target eigenpair and the difficulty of the solve?
- Which assumptions support rapid local convergence of Rayleigh quotient iteration?

## Coverage checklist

- [ ] Derivation of the Rayleigh quotient and inverse iteration
- [ ] Hermitian structure, initial vectors, and nearly singular shifted solves

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

**Planned target:** `nla::inverse_iteration` and `nla::rayleigh_quotient_iteration`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Vary shift distance and matrix class to compare linear and higher-order residual convergence.

### Metrics

- Normalized eigenpair residuals and eigenvector direction errors
- Iteration histories and solve failures for different shifts and initial vectors

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Hiding failures in nearly singular shifted solves**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 26 — Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %})
- Next: [Lecture 28 — QR Algorithm without Shifts]({% link _posts/trefethen/2026-09-15-trefethen-28-qr-algorithm-without-shifts.md %})
