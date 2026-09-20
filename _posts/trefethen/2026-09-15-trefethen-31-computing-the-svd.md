---
layout: post
title: "Trefethen 31 — Computing the SVD"
permalink: /study/trefethen/31-computing-the-svd/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, computing-the-svd]
note_type: numerical-method
series: trefethen-nla
series_order: 31
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 31, “Computing the SVD”
- **Part:** **V — Eigenvalues**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Distinguish the roles of bidiagonalization and bidiagonal SVD. Implement two-sided Householder reduction first and leave a complete SVD solver as an optional extension.

## Prerequisites

- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
- Background: Two-sided orthogonal transformations and bidiagonal matrices

## Guiding questions

- What accuracy issues arise from forming $A^{\ast}A$ to compute the SVD?
- How do bidiagonalization and the bidiagonal SVD stage fit together?

## Coverage checklist

- [ ] Two-sided Householder transformations and bidiagonal reduction
- [ ] Implement reduction first and leave the complete SVD iteration as an optional extension

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

**Planned target:** Bidiagonalization in `eigenvalues.*`; a complete SVD solver is optional

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** First check reconstruction and orthogonality for bidiagonalization. Compare complete SVD results using a reference library or, later, a separately implemented solver.

### Metrics

- Relative Frobenius norm of $A-UBV^{\ast}$ and orthogonality of U and V
- Reference singular values, singular-triplet residuals, and relative errors in small singular values

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Squaring the condition number by explicitly forming $A^{\ast}A$**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 30 — Other Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-30-other-eigenvalue-algorithms.md %})
- Next: [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
