---
layout: post
title: "Trefethen 22 — Stability of Gaussian Elimination"
permalink: /study/trefethen/22-stability-of-gaussian-elimination/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, stability-of-gaussian]
note_type: numerical-method
series: trefethen-nla
series_order: 22
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 22, “Stability of Gaussian Elimination”
- **Part:** **IV — Systems of Equations**
- **Study focus:** Comparison and experiment
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Measure how element growth affects elimination stability.

## Prerequisites

- [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
- [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
- [Lecture 21 — Pivoting]({% link _posts/trefethen/2026-09-15-trefethen-21-pivoting.md %})
- Background: Intermediate elimination matrices and rounding error

## Guiding questions

- Is the growth factor the same as the condition number of the original matrix?
- How can typical inputs be compared with examples exhibiting large element growth?

## Coverage checklist

- [ ] Definition of element growth and which elimination stages to measure
- [ ] Assumptions of backward-error bounds involving growth

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

**Planned target:** growth-factor diagnostics in `experiments/l22_growth_factor.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Explain how reference values are obtained and state their precision.
- [ ] Separate the input variable being changed from the conditions held fixed.
- [ ] Preserve unexpected observations together with their raw output.

## Numerical experiments

**Planned comparison:** Compare growth-factor distributions for structured large-growth examples and random matrices.

### Metrics

- Growth factor tracked over all elimination stages
- Growth, condition number, backward error, and forward error recorded together

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Interpreting the condition number and growth factor as the same quantity**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Fix the comparison conditions and record actual results and reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 21 — Pivoting]({% link _posts/trefethen/2026-09-15-trefethen-21-pivoting.md %})
- Next: [Lecture 23 — Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %})
