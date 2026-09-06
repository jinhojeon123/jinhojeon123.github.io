---
title: Iterative Solvers and Preconditioning
project_id: krylov-solvers
status: Study in progress
order: 2
summary: Follow existing steepest-descent and conjugate-gradient notes toward preconditioned Krylov methods.
pathway: Ax = b → steepest descent → CG / GMRES → preconditioning
---

## Question

How do spectrum, conditioning, and preconditioning influence convergence and the cost of solving a sparse system?

## Reading and implementation order

1. [IEEE 754, Errors, and Algorithms]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — floating-point prerequisites and Python examples.
2. [Steepest Descent with SPD Matrices]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — derivation, convergence discussion, and MATLAB/Python code.
3. [Conjugate Gradient]({% link _posts/2026-02-09-conjugate-gradient.md %}) — working theory and MATLAB implementation notes.
4. Planned: compare CG and GMRES under their respective assumptions.
5. Planned: add preconditioning and connect it to [domain decomposition]({{ '/projects/domain-decomposition/' | relative_url }}).

## Current evidence and limits

The linked posts contain derivations and code snippets. A standalone solver repository, automated numerical regression suite, and reproducible benchmark dataset are not linked yet. Some mathematical arguments are still working notes.

## Planned experiments

Record matrix source and dimensions, conditioning information when available, initial guess, residual definition, stopping tolerance, iteration count, setup time, solve time, and memory use. Compare methods against the same accuracy target and report failures as well as successes.
