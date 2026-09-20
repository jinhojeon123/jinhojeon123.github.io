---
layout: post
title: "Trefethen 24 — Eigenvalue Problems"
permalink: /study/trefethen/24-eigenvalue-problems/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, eigenvalue-problems]
note_type: numerical-method
series: trefethen-nla
series_order: 24
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 24, “Eigenvalue Problems”
- **Part:** **V — Eigenvalues**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Understand conditioning differences between normal and nonnormal eigenvalue problems.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- Background: Eigenvalues, eigenvectors, and similarity

## Guiding questions

- How do the assumptions for Schur form and diagonalization differ?
- How does eigenvalue sensitivity differ between normal and nonnormal matrices?

## Coverage checklist

- [ ] Structure and conditioning of eigenvalue problems
- [ ] Distinguishing Hermitian, normal, and defective examples

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

**Planned target:** `experiments/l24_eigenvalue_conditioning.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Measure eigenvalue movement and eigenvector conditioning after small matrix perturbations.

### Metrics

- Normalized eigenpair residuals
- Changes in eigenvalue sets under perturbation and the matching method used

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Matching eigenvalues before and after perturbation solely by their sorted indices**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 23 — Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %})
- Next: [Lecture 25 — Overview of Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-25-overview-of-eigenvalue-algorithms.md %})
