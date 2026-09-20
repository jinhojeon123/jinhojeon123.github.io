---
layout: post
title: "Trefethen 10 — Householder Triangularization"
permalink: /study/trefethen/10-householder-triangularization/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, householder-triangularization]
note_type: numerical-method
series: trefethen-nla
series_order: 10
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 10, “Householder Triangularization”
- **Part:** **II — QR Factorization and Least Squares**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement stable Householder reflectors and reduced QR.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 07 — QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %})
- [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
- Background: Vector normalization and rank-one updates

## Guiding questions

- How does the sign or phase of a Householder reflector affect cancellation?
- What must be stored to apply reflectors without forming Q?

## Coverage checklist

- [ ] Reflector construction and column elimination
- [ ] Implicit application of Q, operation counts, and additional storage

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

**Planned target:** `nla::householder_qr` in `qr.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Compare cancellation, reconstruction, and orthogonality under different reflector sign choices.

### Metrics

- Relative Frobenius norm of A−QR and orthogonality error of Q
- Vector norms before and after reflection and the magnitudes of eliminated components

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Incorrect complex phase handling and the cost of multiplying explicit reflector matrices**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 09 — MATLAB]({% link _posts/trefethen/2026-09-15-trefethen-09-matlab.md %})
- Next: [Lecture 11 — Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md %})
