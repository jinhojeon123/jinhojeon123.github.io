---
layout: post
title: "Trefethen 18 — Conditioning of Least Squares Problems"
permalink: /study/trefethen/18-conditioning-of-least-squares-problems/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, conditioning-of-least]
note_type: numerical-method
series: trefethen-nla
series_order: 18
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 18, “Conditioning of Least Squares Problems”
- **Part:** **III — Conditioning and Stability**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Explain the sensitivity of least-squares solutions and residuals using angles and condition numbers.

## Prerequisites

- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- [Lecture 11 — Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md %})
- [Lecture 12 — Conditioning and Condition Numbers]({% link _posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md %})
- Background: Least-squares residuals and angles to subspaces

## Guiding questions

- Can the direction of b change solution sensitivity for a fixed A?
- How does sensitivity differ when only A or only b is perturbed?

## Coverage checklist

- [ ] The roles of singular values and the residual angle in least-squares conditioning
- [ ] Interpretation of relative error when the solution or projection is zero

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

**Planned target:** `experiments/l18_least_squares_conditioning.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Measure perturbation effects while varying the residual angle and singular-value distribution.

### Metrics

- Relative solution changes with perturbations of A and b tested separately
- Amplification versus residual angle for a fixed singular spectrum

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Treating the condition numbers for perturbations of A and b as the same quantity**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 17 — Stability of Back Substitution]({% link _posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md %})
- Next: [Lecture 19 — Stability of Least Squares Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-19-stability-of-least-squares-algorithms.md %})
