---
layout: post
title: "Trefethen 11 — Least Squares Problems"
permalink: /study/trefethen/11-least-squares-problems/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, least-squares-problems]
note_type: numerical-method
series: trefethen-nla
series_order: 11
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 11, “Least Squares Problems”
- **Part:** **II — QR Factorization and Least Squares**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Solve full-column-rank least-squares problems using Householder QR.

## Prerequisites

- [Lecture 06 — Projectors]({% link _posts/trefethen/2026-09-15-trefethen-06-projectors.md %})
- [Lecture 07 — QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %})
- [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- Background: Rectangular matrices with full column rank

## Guiding questions

- Why is the least-squares residual orthogonal to range(A)?
- Which triangular problem does QR produce from the original problem?

## Coverage checklist

- [ ] Existence and uniqueness when m≥n and A has full column rank
- [ ] Derivation of the normal equations and comparison with a QR solve

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

**Planned target:** `nla::least_squares_qr` in `qr.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Check that the residual is orthogonal to range(A) and measure error against an Eigen reference solution.

### Metrics

- Residual 2-norm and norm of $A^{\ast}r$
- Differences from reference QR/SVD solutions and handling of rank-deficient inputs

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Using normal equations as the default solver or ignoring rank deficiency**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- Next: [Lecture 12 — Conditioning and Condition Numbers]({% link _posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md %})
