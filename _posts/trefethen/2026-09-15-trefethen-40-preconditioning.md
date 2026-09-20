---
layout: post
title: "Trefethen 40 — Preconditioning"
permalink: /study/trefethen/40-preconditioning/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, preconditioning]
note_type: numerical-method
series: trefethen-nla
series_order: 40
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 40, “Preconditioning”
- **Part:** **VI — Iterative Methods**
- **Study focus:** Algorithm and implementation
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## Goal and scope

Apply preconditioners as operators and evaluate convergence improvement relative to cost.

## Prerequisites

- [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
- [Lecture 35 — GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %})
- [Lecture 38 — Conjugate Gradients]({% link _posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md %})
- Background: Linear-system solves and SPD conditions

## Guiding questions

- Which costs should a good preconditioner reduce besides the iteration count?
- How do left/right preconditioning and the assumptions of PCG differ?

## Coverage checklist

- [ ] Applying a solve with M instead of forming its inverse
- [ ] SPD assumptions for PCG, scaling, and the connection between spectrum and convergence

## Mathematical development

### Setup and notation

<!-- TODO: Specify dimensions, the scalar field, relevant rank/structure assumptions, and norms. -->

### Definitions and results

<!-- TODO: State the assumptions and conclusions of the main results separately, in your own words. -->

### Derivation and examples

<!-- TODO: Derive the key identity or proof sketch, then add small examples and boundary cases. -->

## Algorithm and cost

<!-- Fill in the procedure for this lecture. Direct methods do not need an artificial iterative stopping criterion. -->

- [ ] Specify input/output dimensions and required assumptions.
- [ ] Derive the main updates and work through a small example by hand.
- [ ] Define stopping/failure conditions or inputs for which the factorization is unavailable.
- [ ] Distinguish operation counts, additional storage, and reusable factorizations.

## C++ implementation plan

**Planned target:** `nla::preconditioned_cg` in `iterative.*`

<!-- TODO: After implementation, add a source-file/commit link and a minimal usage example.
The names above describe planned work, not an existing or validated API. -->

- [ ] Define a minimal API, input checks, and failure status.
- [ ] Test small valid inputs and the boundary/failure cases relevant to this lecture.
- [ ] Align sign, phase, and permutation conventions when comparing with Eigen or another reference implementation.

## Numerical experiments

**Planned comparison:** Compare iteration counts, residuals, and total time for no preconditioning, Jacobi, and an optional additional preconditioner.

### Metrics

- True relative residual of the original linear system
- Iteration counts and total time including setup for no preconditioning versus Jacobi

Specify every norm and normalization. If a relative-error denominator is zero, also report absolute error.

### Reproduction record

<!-- TODO: Follow the series guide's reproduction checklist.
Record compiler/Eigen versions, scalar type, build flags, matrix family/size, seed,
relevant condition numbers/spectra/tolerances, commands, code commit, and raw output.
Do not invent measurements or plots for experiments that have not been run. -->

### Results and interpretation

<!-- TODO: After running the experiment, add tables/plots, expectations, observations, and explanations of any differences. -->

## Pitfalls

**Forming an explicit inverse or excluding setup cost**

<!-- TODO: Discuss assumption violations, conditioning, rounding, and cost issues relevant to this lecture. -->

## Review and open questions

- [ ] Answer the guiding questions and reconstruct the main derivation with the book closed.
- [ ] Validate the implementation and boundary cases, and record reproduction commands.
- [ ] Record unresolved steps and the sources to consult next.

<!-- TODO: Record study dates and unresolved questions. Update status after developing the body of the note. -->

## Previous / Next

- Previous: [Lecture 39 — Biorthogonalization Methods]({% link _posts/trefethen/2026-09-15-trefethen-39-biorthogonalization-methods.md %})
- Next: [Saad Study]({% link study/saad/index.md %}) — further study of iterative methods and preconditioning
