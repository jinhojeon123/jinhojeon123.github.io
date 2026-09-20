---
layout: post
title: "Trefethen 19 — Stability of Least Squares Algorithms"
permalink: /study/trefethen/19-stability-of-least-squares-algorithms/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, stability-of-least]
note_type: numerical-method
series: trefethen-nla
series_order: 19
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 19, “Stability of Least Squares Algorithms”
- **Part:** **III — Conditioning and Stability**
- **Study focus:** Comparison and experiment
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Compare normal equations, CGS/MGS, Householder QR, and SVD in terms of stability and cost.

## Prerequisites

- [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
- [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- [Lecture 18 — Conditioning of Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md %})
- Background: Normal equations, Householder QR, and definitions of stability

## Guiding questions

- Why can normal equations and QR have different accuracy despite giving the same solution in exact arithmetic?
- Is a small least-squares residual enough to compare solution accuracy?

## Coverage checklist

- [ ] Conditions for comparing CGS, MGS, Householder QR, and normal equations
- [ ] Precision and rank tolerance of the SVD reference solution

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

**Planned target:** `experiments/l19_least_squares_solvers.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Explain how reference values are obtained and state their precision.
- [ ] Separate the input variable being changed from the conditions held fixed.
- [ ] Preserve unexpected observations together with their raw output.

## Numerical experiments

**Planned comparison:** Record coefficient error, residual, and backward error together for ill-conditioned design matrices.

### Metrics

- Forward error, residual, $A^{\ast}r$, and orthogonality of Q
- Accuracy versus condition number and execution time under identical conditions

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Failing to check the precision of the reference solution**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Fix the comparison conditions and record actual results and reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 18 — Conditioning of Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md %})
- Next: [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
