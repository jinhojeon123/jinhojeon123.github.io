---
layout: post
title: "Trefethen 32 — Overview of Iterative Methods"
permalink: /study/trefethen/32-overview-of-iterative-methods/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, overview-of-iterative]
note_type: numerical-method
series: trefethen-nla
series_order: 32
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 32, “Overview of Iterative Methods”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Comparison and experiment
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Design matrix-free operations and stopping criteria for large-scale problems.

## Prerequisites

- [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %})
- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- Background: Sparse matrix storage and matrix-vector operations

## Guiding questions

- Can an implementation provide Ax without storing every matrix entry?
- How should factorization and iteration costs be compared for large problems?

## Coverage checklist

- [ ] Goals and costs of direct and iterative methods
- [ ] Personal extension: the input/output contract of a matrix-free LinearOperator

## Mathematical development

### Setup and notation

<!-- TODO: Specify dimensions, the scalar field, relevant rank/structure assumptions, and norms. -->

### Definitions and results

<!-- TODO: State the assumptions and conclusions of the main results separately, in your own words. -->

### Derivation and examples

<!-- TODO: Derive the key identity or proof sketch, then add small examples and boundary cases. -->

## C++ comparison plan

Use existing operations or implementations to construct a controlled experiment.
Record any differences in precision or stopping criteria between the implementations.

**Planned target:** `nla::LinearOperator` and `experiments/l32_matrix_free.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Explain how reference values are obtained and state their precision.
- [ ] Separate the input variable being changed from the conditions held fixed.
- [ ] Preserve unexpected observations together with their raw output.

## Numerical experiments

**Planned comparison:** Compare memory use and execution time for dense-matrix and operator-only matvecs.

### Metrics

- Differences between dense and operator-only evaluations of the same operation
- Storage, matvec time, and total call counts versus problem size

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Hiding a matrix behind an operator interface while reconstructing it densely inside**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Fix the comparison conditions and record actual results and reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 31 — Computing the SVD]({% link _posts/trefethen/2026-09-15-trefethen-31-computing-the-svd.md %})
- Next: [Lecture 33 — The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %})
