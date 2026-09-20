---
layout: post
title: "Trefethen 35 — GMRES"
permalink: /study/trefethen/35-gmres/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, gmres]
note_type: numerical-method
series: trefethen-nla
series_order: 35
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 35, “GMRES”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Implement GMRES through the small least-squares problem produced by Arnoldi.

## Prerequisites

- [Lecture 11 — Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md %})
- [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
- [Lecture 33 — The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %})
- Background: Krylov subspaces and least squares

## Guiding questions

- Why does residual minimization reduce to a small Hessenberg least-squares problem?
- Does the predicted residual always match an explicit evaluation of b−Ax?

## Coverage checklist

- [ ] Derivation of residual minimization using Arnoldi
- [ ] Distinguishing a zero initial residual, breakdown, iteration limits, and restart

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

**Planned target:** `nla::gmres` in `iterative.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Compare explicitly computed and reported residuals, including nonnormal examples.

### Metrics

- Histories of the true relative residual and the internal residual estimate
- Matvec counts, storage, orthogonalization time, and termination status

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Solving the small least-squares problem through normal equations or ignoring breakdown**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 34 — How Arnoldi Locates Eigenvalues]({% link _posts/trefethen/2026-09-15-trefethen-34-how-arnoldi-locates-eigenvalues.md %})
- Next: [Lecture 36 — The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %})
