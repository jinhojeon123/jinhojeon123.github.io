---
layout: post
title: "Trefethen 12 — Conditioning and Condition Numbers"
permalink: /study/trefethen/12-conditioning-and-condition-numbers/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, conditioning-and-condition]
note_type: numerical-method
series: trefethen-nla
series_order: 12
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 12, “Conditioning and Condition Numbers”
- **Part:** **III — Conditioning and Stability**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Connect problem sensitivity to the 2-norm condition number.

## Prerequisites

- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- Background: Differentiation and relative changes

## Guiding questions

- Is a condition number a property of the problem or the algorithm?
- How does a worst-case perturbation direction differ from a random one?

## Coverage checklist

- [ ] Definitions of absolute and relative conditioning
- [ ] Condition numbers for matrix multiplication and linear systems, and their connection to singular values

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

**Planned target:** `nla::condition_number_2` in `stability.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Compare controlled perturbation sizes and relative output changes with a conditioning bound.

### Metrics

- Ratio of relative output change to relative input change
- Observed amplification versus the condition number across perturbation directions and magnitudes

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Confusing problem conditioning with implementation error**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 11 — Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md %})
- Next: [Lecture 13 — Floating Point Arithmetic]({% link _posts/trefethen/2026-09-15-trefethen-13-floating-point-arithmetic.md %})
