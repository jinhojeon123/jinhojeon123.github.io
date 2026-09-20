---
layout: post
title: "Trefethen 01 — Matrix-Vector Multiplication"
permalink: /study/trefethen/01-matrix-vector-multiplication/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, matrix-vector-multiplication]
note_type: numerical-method
series: trefethen-nla
series_order: 1
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 1, “Matrix-Vector Multiplication”
- **Part:** **I — Fundamentals**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Interpret and implement Ax as a linear combination of columns. Distinguish it from the outer-product expansion of AB, and explain the dimensions and computation order.

## Prerequisites

- Background: Matrix and vector dimensions, linear combinations, and the definition of matrix multiplication

## Guiding questions

- In the column expansion of Ax, what coefficient multiplies each column?
- How does the outer-product expansion of AB differ from the column expansion of Ax?

## Coverage checklist

- [ ] Column accumulation versus row-wise inner products
- [ ] Output dimensions and multiplication/addition counts for rectangular inputs

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

**Planned target:** `nla::matvec_by_columns` in `fundamentals.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Compare errors against Eigen `A * x` and execution times across matrix sizes.

### Metrics

- Absolute and relative 2-norm errors against Eigen
- Execution time and temporary memory use as matrix size varies

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Dimension mismatches, aliasing, and unnecessary temporary objects**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Linear Algebra Review]({% link study/linear-algebra/index.md %}) — first lecture in this series
- Next: [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
