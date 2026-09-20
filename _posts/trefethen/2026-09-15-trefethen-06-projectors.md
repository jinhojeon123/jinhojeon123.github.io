---
layout: post
title: "Trefethen 06 — Projectors"
permalink: /study/trefethen/06-projectors/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, projectors]
note_type: numerical-method
series: trefethen-nla
series_order: 6
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 6, “Projectors”
- **Part:** **II — QR Factorization and Least Squares**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Compare orthogonal and oblique projections and check the algebraic and geometric conditions for orthogonal projection.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- Background: Direct sums of subspaces

## Guiding questions

- Does P²=P alone imply that P is an orthogonal projector?
- How do the ranges and null spaces of orthogonal and oblique projectors differ?

## Coverage checklist

- [ ] Idempotence and orthogonality conditions for projectors
- [ ] Derivation of P=$QQ^{\ast}$ from an orthonormal basis

## Mathematical development

### Setup and notation

<!-- TODO: Specify dimensions, the scalar field, relevant rank/structure assumptions, and norms. -->

### Definitions and results

<!-- TODO: State the assumptions and conclusions of the main results separately, in your own words. -->

### Derivation and examples

<!-- TODO: Derive the key identity or proof sketch, then add small examples and boundary cases. -->

## C++ verification plan

Use small computations to illustrate the definitions and results in this theory lecture.
Add a new solver implementation only when it serves the topic.

**Planned target:** `nla::orthogonal_projector` in `qr.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Check Hermitian symmetry, idempotence, the minimum-distance property, and residual orthogonality.

### Metrics

- Norms of P²−P and $P^{\ast}-P$
- Orthogonality of the projection residual and the minimum-distance property

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Applying `QQ*` when the columns of Q are not orthonormal**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 05 — More on the SVD]({% link _posts/trefethen/2026-09-15-trefethen-05-more-on-the-svd.md %})
- Next: [Lecture 07 — QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %})
