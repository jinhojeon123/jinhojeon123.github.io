---
layout: post
title: "Trefethen 23 — Cholesky Factorization"
permalink: /study/trefethen/23-cholesky-factorization/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, cholesky-factorization]
note_type: numerical-method
series: trefethen-nla
series_order: 23
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 23, “Cholesky Factorization”
- **Part:** **IV — Systems of Equations**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement Cholesky factorization for Hermitian positive definite matrices.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 17 — Stability of Back Substitution]({% link _posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md %})
- [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
- Background: Hermitian positive definite matrices

## Guiding questions

- Where is positive definiteness needed in the Cholesky recurrence?
- What can fail if the input is only symmetric?

## Coverage checklist

- [ ] Derivation of $A=LL^{\ast}$ and positivity of pivots
- [ ] Triangular storage, solution, and reporting nonpositive pivots

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

**Planned target:** `nla::cholesky` in `systems.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Check `A=LL*`, triangular structure, success on SPD inputs, and failure handling on non-SPD inputs.

### Metrics

- Relative Frobenius norm of $A-LL^{\ast}$
- Backward error for SPD systems and failure handling for non-SPD inputs

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Assuming positive definiteness after checking symmetry alone**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 22 — Stability of Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-22-stability-of-gaussian-elimination.md %})
- Next: [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
