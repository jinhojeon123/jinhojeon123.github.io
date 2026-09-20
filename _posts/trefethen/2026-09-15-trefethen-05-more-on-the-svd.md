---
layout: post
title: "Trefethen 05 — More on the SVD"
permalink: /study/trefethen/05-more-on-the-svd/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, more-on-the]
note_type: numerical-method
series: trefethen-nla
series_order: 5
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 5, “More on the SVD”
- **Part:** **I — Fundamentals**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Connect the pseudoinverse, rank, and best rank-k approximation through singular values.

## Prerequisites

- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- Background: Rank and the definition of the least-squares problem

## Guiding questions

- How is the rank-k approximation error related to discarded singular values?
- Why does numerical rank depend on a tolerance while mathematical rank does not?

## Coverage checklist

- [ ] Optimal approximation in the spectral and Frobenius norms
- [ ] Personal extension: the pseudoinverse and the effect of a truncation threshold

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

**Planned target:** `nla::truncated_svd` in `fundamentals.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Measure approximation error at each rank. Compare the 2-norm error with the next singular value and the Frobenius error with the square root of the sum of squared discarded singular values.

### Metrics

- Comparison of the 2-norm error with σ(k+1)
- Comparison of the Frobenius error with the square root of the sum of squared discarded singular values

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Using an arbitrary tolerance to treat every small singular value as zero**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- Next: [Lecture 06 — Projectors]({% link _posts/trefethen/2026-09-15-trefethen-06-projectors.md %})
