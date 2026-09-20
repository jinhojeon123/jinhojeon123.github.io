---
layout: post
title: "Trefethen 30 — Other Eigenvalue Algorithms"
permalink: /study/trefethen/30-other-eigenvalue-algorithms/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, other-eigenvalue-algorithms]
note_type: numerical-method
series: trefethen-nla
series_order: 30
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 30, “Other Eigenvalue Algorithms”
- **Part:** **V — Eigenvalues**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Compare the assumptions, ideas, and costs of the eigenvalue algorithms introduced in the book. Select one method of interest as an optional implementation extension.

## Prerequisites

- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 26 — Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %})
- [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
- Background: Structure of Hermitian eigenproblems

## Guiding questions

- Which inputs and outputs are targeted by bisection, divide-and-conquer, and other alternatives?
- Which costs matter when comparing selected-eigenvalue methods with full QR?

## Coverage checklist

- [ ] Assumptions, central ideas, and costs of the book's alternative algorithms
- [ ] Optional extension: implement one method or compare it through a validated library

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

**Planned target:** Optional extension: compare one method in `experiments/l30_other_eigensolver.cpp`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Compare the selected method with QR or a validated reference solver. Fix the input structure and requested eigenvalue range first.

### Metrics

- Eigenpair residuals and the requested eigenvalue range for the selected method
- Time and memory at the same accuracy target

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Comparing algorithms with different objectives using iteration counts alone**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
- Next: [Lecture 31 — Computing the SVD]({% link _posts/trefethen/2026-09-15-trefethen-31-computing-the-svd.md %})
