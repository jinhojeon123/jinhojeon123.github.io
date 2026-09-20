---
layout: post
title: "Trefethen 28 — QR Algorithm without Shifts"
permalink: /study/trefethen/28-qr-algorithm-without-shifts/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, qr-algorithm-without]
note_type: numerical-method
series: trefethen-nla
series_order: 28
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 28, “QR Algorithm without Shifts”
- **Part:** **V — Eigenvalues**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement unshifted QR iteration and connect it to simultaneous iteration.

## Prerequisites

- [Lecture 07 — QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %})
- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 26 — Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %})
- Background: Similarity and orthogonal iteration

## Guiding questions

- How can a QR step be shown to be a similarity transformation?
- When can unshifted QR be slow or fail to make progress?

## Coverage checklist

- [ ] The connection between QR iteration and simultaneous iteration
- [ ] Target forms and convergence assumptions for Hermitian and general inputs

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

**Planned target:** `nla::qr_algorithm(..., false)` in `eigenvalues.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Track subdiagonal norms and eigenvalue residuals for symmetric and general matrices.

### Metrics

- Evolution of subdiagonal magnitudes
- Orthogonality of the accumulated Q and Schur/eigenpair residuals

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Misinterpreting cost when using dense QR at every step without Hessenberg reduction**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 27 — Rayleigh Quotient, Inverse Iteration]({% link _posts/trefethen/2026-09-15-trefethen-27-rayleigh-quotient-inverse-iteration.md %})
- Next: [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
