---
layout: post
title: "Trefethen 15 — More on Stability"
permalink: /study/trefethen/15-more-on-stability/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, more-on-stability]
note_type: numerical-method
series: trefethen-nla
series_order: 15
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 15, “More on Stability”
- **Part:** **III — Conditioning and Stability**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Use examples to understand algorithm composition and the scope of backward stability.

## Prerequisites

- [Lecture 12 — Conditioning and Condition Numbers]({% link _posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md %})
- [Lecture 13 — Floating Point Arithmetic]({% link _posts/trefethen/2026-09-15-trefethen-13-floating-point-arithmetic.md %})
- [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
- Background: Algorithm composition and intermediate variables

## Guiding questions

- If every step is stable, is the complete algorithm necessarily stable?
- How does the accuracy of intermediate quantities differ from that of the final result?

## Coverage checklist

- [ ] Tracking the perturbed inputs in the book's stability examples
- [ ] Distinguishing errors at individual steps from backward error for the complete problem

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

**Planned target:** `experiments/l15_stability_composition.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Compare well-conditioned and ill-conditioned inputs at similar levels of backward error.

### Metrics

- Forward errors at individual steps and final backward error
- Error behavior for inputs with different condition numbers

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Equating local error with stability of the complete algorithm**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
- Next: [Lecture 16 — Stability of Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-16-stability-of-householder-triangularization.md %})
