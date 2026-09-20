---
layout: post
title: "Trefethen 04 — The Singular Value Decomposition"
permalink: /study/trefethen/04-the-singular-value-decomposition/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, the-singular-value]
note_type: numerical-method
series: trefethen-nla
series_order: 4
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 4, “The Singular Value Decomposition”
- **Part:** **I — Fundamentals**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Explain the dimensions of full and reduced SVDs and their relationship to the four fundamental subspaces.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- Background: Rank, range, and null space

## Guiding questions

- How does the SVD map the unit sphere to an ellipsoid?
- How do the dimensions of full, reduced, and rank-r SVDs differ?

## Coverage checklist

- [ ] Singular vectors and the four fundamental subspaces
- [ ] Existence and geometry of the SVD for rectangular and rank-deficient matrices

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

**Planned target:** `experiments/l04_svd_geometry.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Use Eigen's SVD as a reference to check reconstruction errors and singular-vector relations.

### Metrics

- Relative Frobenius reconstruction error
- Singular-triplet residuals and orthogonality errors for U and V

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Confusing thin and full shapes for rank-deficient inputs**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- Next: [Lecture 05 — More on the SVD]({% link _posts/trefethen/2026-09-15-trefethen-05-more-on-the-svd.md %})
