---
layout: post
title: "Trefethen 13 — Floating Point Arithmetic"
permalink: /study/trefethen/13-floating-point-arithmetic/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, floating-point-arithmetic]
note_type: numerical-method
series: trefethen-nla
series_order: 13
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 13, “Floating Point Arithmetic”
- **Part:** **III — Conditioning and Stability**
- **Study focus:** Comparison and experiment
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Observe IEEE 754 rounding, unit roundoff, and cancellation in C++.

## Prerequisites

- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- Background: Significands, exponents, and rounding

## Guiding questions

- How does unit roundoff differ from numeric_limits epsilon?
- Which inputs exhibit cancellation, overflow, or underflow?

## Coverage checklist

- [ ] Assumptions and scope of the round-to-nearest model
- [ ] Personal extension: summation order and the C++ floating-point environment

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

**Planned target:** `experiments/l13_floating_point.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Explain how reference values are obtained and state their precision.
- [ ] Separate the input variable being changed from the conditions held fixed.
- [ ] Preserve unexpected observations together with their raw output.

## Numerical experiments

**Planned comparison:** Experiment with `std::numeric_limits`, summation order, and subtraction of nearby numbers.

### Metrics

- Spacing between adjacent representable numbers
- Errors against exact small examples or a validated higher-precision reference

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Failing to distinguish machine epsilon from unit roundoff**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Fix the comparison conditions and record actual results and reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 12 — Conditioning and Condition Numbers]({% link _posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md %})
- Next: [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
