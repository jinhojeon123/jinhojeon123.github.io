---
layout: post
title: "Trefethen 09 — MATLAB"
permalink: /study/trefethen/09-matlab/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, matlab]
note_type: numerical-method
series: trefethen-nla
series_order: 9
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 9, “MATLAB”
- **Part:** **II — QR Factorization and Least Squares**
- **Study focus:** Comparison and experiment
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Translate the book's MATLAB notation into C++/Eigen indexing, blocks, adjoints, and storage conventions.

## Prerequisites

- [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %})
- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 07 — QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %})
- Background: C++ types, arrays, and functions, and basic Eigen matrix representations

## Guiding questions

- How can the book's 1-based slices be expressed as 0-based C++ blocks?
- How are matrix products, elementwise products, transpose, and adjoint distinguished in code?

## Coverage checklist

- [ ] Small Eigen calculations equivalent to the book's MATLAB examples
- [ ] Personal extension: object lifetimes, aliasing, and storage order

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

**Planned target:** `experiments/l09_eigen_primer.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Explain how reference values are obtained and state their precision.
- [ ] Separate the input variable being changed from the conditions held fixed.
- [ ] Preserve unexpected observations together with their raw output.

## Numerical experiments

**Planned comparison:** Reproduce the same small calculations side by side in MATLAB notation and Eigen code.

### Metrics

- Agreement between expected and computed entries in small matrices
- Dimensions and results for real, complex, and rectangular inputs

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Confusing 1-based/0-based indexing and row-major/column-major storage assumptions**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Fix the comparison conditions and record actual results and reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
- Next: [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
