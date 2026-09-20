---
layout: post
title: "Trefethen 07 — QR Factorization"
permalink: /study/trefethen/07-qr-factorization/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, qr-factorization]
note_type: numerical-method
series: trefethen-nla
series_order: 7
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 7, “QR Factorization”
- **Part:** **II — QR Factorization and Least Squares**
- **Study focus:** Theory and derivation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Explain the structure, existence, and uniqueness conditions of reduced and full QR factorizations.

## Prerequisites

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 06 — Projectors]({% link _posts/trefethen/2026-09-15-trefethen-06-projectors.md %})
- Background: Linear independence and rank

## Guiding questions

- What information do full and reduced QR factorizations share?
- How do sign or phase conventions on the diagonal of R affect uniqueness?

## Coverage checklist

- [ ] The full-column-rank assumption and existence of QR
- [ ] Dimensions of Q and R and conditions for uniqueness

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

**Planned target:** `nla::QrFactorization` validation experiment

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Choose a small example that can be checked by hand and an example that violates an assumption.
- [ ] Compute the quantities of interest using existing operations or a validated library.
- [ ] Distinguish a finite collection of experiments from a general proof.

## Numerical experiments

**Planned comparison:** Check `A=QR`, `Q*Q=I`, and factor dimensions for rectangular matrices.

### Metrics

- Relative Frobenius reconstruction error
- Norm of $Q^{\ast}Q-I$ and the strictly lower-triangular part of R

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Treating diagonal sign or complex phase differences as incorrect results**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Use a small example or verification experiment to explain the result and its limitations.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 06 — Projectors]({% link _posts/trefethen/2026-09-15-trefethen-06-projectors.md %})
- Next: [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
