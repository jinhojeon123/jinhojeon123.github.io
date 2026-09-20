---
layout: post
title: "Trefethen 33 — The Arnoldi Iteration"
permalink: /study/trefethen/33-the-arnoldi-iteration/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, the-arnoldi-iteration]
note_type: numerical-method
series: trefethen-nla
series_order: 33
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 33, “The Arnoldi Iteration”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Use Arnoldi iteration to construct an orthonormal Krylov basis and a Hessenberg projection.

## Prerequisites

- [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
- [Lecture 26 — Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %})
- [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
- Background: Krylov subspaces and orthogonalization

## Guiding questions

- Why is the final vector term needed in the Arnoldi relation?
- How does happy breakdown differ from numerical loss of orthogonality?

## Coverage checklist

- [ ] Construction of a Krylov basis and the Hessenberg recurrence
- [ ] Reorthogonalization and handling small subdiagonal entries

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

**Planned target:** `nla::arnoldi` in `iterative.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Check the Arnoldi relation, orthogonality, and happy breakdown.

### Metrics

- Normalized residual of the Arnoldi relation
- Norm of $Q^{\ast}Q-I$ and matvec/orthogonalization costs versus basis size

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Testing a small subdiagonal entry only for exact equality to zero**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
- Next: [Lecture 34 — How Arnoldi Locates Eigenvalues]({% link _posts/trefethen/2026-09-15-trefethen-34-how-arnoldi-locates-eigenvalues.md %})
