---
layout: post
title: "Trefethen 16 — Stability of Householder Triangularization"
permalink: /study/trefethen/16-stability-of-householder-triangularization/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, stability-of-householder]
note_type: numerical-method
series: trefethen-nla
series_order: 16
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 16, “Stability of Householder Triangularization”
- **Part:** **III — Conditioning and Stability**
- **Study focus:** Comparison and experiment
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Connect the backward-stability statement for Householder QR to computed results.

## Prerequisites

- [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- [Lecture 13 — Floating Point Arithmetic]({% link _posts/trefethen/2026-09-15-trefethen-13-floating-point-arithmetic.md %})
- [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
- Background: Implicit storage of Householder reflectors

## Guiding questions

- Why can errors in the computed Q and R differ from the error in their product?
- Is the exactly unitary matrix in the analysis the same object as the stored Q?

## Coverage checklist

- [ ] Assumptions and conclusion of backward stability for Householder QR
- [ ] Separating additional errors introduced when forming Q explicitly

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

**Planned target:** Householder QR diagnostics in `experiments/l16_householder_stability.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Explain how reference values are obtained and state their precision.
- [ ] Separate the input variable being changed from the conditions held fixed.
- [ ] Preserve unexpected observations together with their raw output.

## Numerical experiments

**Planned comparison:** Compare `||A-QR||/||A||` and `||Q*Q-I||` with unit roundoff across matrix sizes.

### Metrics

- Normalized Frobenius norm of A−QR
- Norm of $Q^{\ast}Q-I$ recorded alongside dimension and unit roundoff

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Confusing errors from forming Q with the implicit reflector representation**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Fix the comparison conditions and record actual results and reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 15 — More on Stability]({% link _posts/trefethen/2026-09-15-trefethen-15-more-on-stability.md %})
- Next: [Lecture 17 — Stability of Back Substitution]({% link _posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md %})
