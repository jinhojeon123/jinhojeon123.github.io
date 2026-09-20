---
layout: page
title: "Trefethen NLA in C++"
permalink: /study/trefethen/
math: true
toc: true
status: outline
---

Reference: Lloyd N. Trefethen and David Bau III, *Numerical Linear Algebra*,
SIAM, 1997 / 25th Anniversary Edition, 2022.

Sources: [Author's book page](https://people.maths.ox.ac.uk/trefethen/text.html) ·
[SIAM 25th Anniversary Edition](https://epubs.siam.org/doi/book/10.1137/1.9781611977165)

This study series follows the book's 40 lectures, develops the mathematical arguments,
and explores their numerical meaning through C++20/Eigen computations. Book content
and personal implementation extensions are identified separately. Lecture 09 covers
MATLAB in the book; its C++/Eigen adaptation is a personal extension.

[Study roadmap]({% link STUDY-ROADMAP.md %}) ·
[Linear Algebra Review]({% link study/linear-algebra/index.md %}) ·
[Saad Study]({% link study/saad/index.md %})

## Writing workflow

1. Review the lecture's goals, prerequisites, and guiding questions.
2. Fix assumptions and notation, then derive the main results.
3. Develop examples, implementations, or comparisons according to the study focus below.
4. Record actual results and open questions, then update the note's status.

| Study focus | Main deliverable |
|---|---|
| Theory and derivation | Definitions, results, derivations, small examples, and limits of the assumptions. A new solver is optional |
| Algorithm and implementation | Updates, costs, API, failure handling, tests, and reproducible experiments |
| Comparison and experiment | Controlled comparisons, reference values, metrics, observations, and interpretation |

Prerequisite links identify needed background; the Previous/Next links at the end of
each note describe reading order. An empty outline is a plan, not a completed argument.
Include key equations and usage examples in the blog, with links to actual source files
and commits. Function and file names below are **implementation plans**. Add the code
repository URL and implementation status after verifying them.

## Shared notation and reproduction records

- $A^*$ denotes the conjugate transpose, which equals the transpose for real matrices.
  State matrix and vector dimensions first.
- Distinguish vector norms, induced matrix norms, and the Frobenius norm.
- Distinguish exact-arithmetic results, problem conditioning, and algorithm stability.
- State the denominators in relative errors and normalized residuals, including how zeros are handled.
- Record the code commit, compiler/Eigen versions, scalar type, build flags, input
  generation method, size, seed, relevant tolerances, commands, and raw output.
- For timings, state how measurements are repeated and whether setup costs are included.
  Omit irrelevant items with a brief explanation.

## New notes and status

Use `templates/trefethen-lecture.md` in the repository for a new note.
Files for Lectures 01–40 already exist, so develop the existing file for each lecture.
Check the title, date, `series_order`, and `permalink`, and preserve existing URLs.
Remove `published: false` from a new file when it is ready to publish.

- `status: outline`: a reading or writing plan.
- `status: working-note`: a note with content and derivations in progress.
- `status: note`: a note whose assumptions, derivations, examples, and necessary checks have been reviewed.

The `(outline)` label in this blog's series list comes from `status: outline` in the
**individual post**. Change that post's status after developing its content.
Changing the status of this index page does not change the status of every lecture.

## Recommended order

[Linear Algebra Review]({% link study/linear-algebra/index.md %})
→ Trefethen Part I–V
→ Trefethen Part VI
→ [Saad Study]({% link study/saad/index.md %})

## I — Fundamentals

| L | Lecture | Focus | C++ verification / implementation plan |
|---:|---|---|---|
| 01 | [Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %}) | Algorithm and implementation | `nla::matvec_by_columns` in `fundamentals.*` |
| 02 | [Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %}) | Theory and derivation | `nla::orthogonality_error` and a unitary-invariance experiment |
| 03 | [Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %}) | Theory and derivation | planned norm helpers in `fundamentals.*` |
| 04 | [The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %}) | Theory and derivation | `experiments/l04_svd_geometry.cpp` |
| 05 | [More on the SVD]({% link _posts/trefethen/2026-09-15-trefethen-05-more-on-the-svd.md %}) | Theory and derivation | `nla::truncated_svd` in `fundamentals.*` |

## II — QR Factorization and Least Squares

| L | Lecture | Focus | C++ verification / implementation plan |
|---:|---|---|---|
| 06 | [Projectors]({% link _posts/trefethen/2026-09-15-trefethen-06-projectors.md %}) | Theory and derivation | `nla::orthogonal_projector` in `qr.*` |
| 07 | [QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %}) | Theory and derivation | `nla::QrFactorization` validation experiment |
| 08 | [Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %}) | Algorithm and implementation | `nla::classical_gram_schmidt` and `nla::modified_gram_schmidt` |
| 09 | [MATLAB]({% link _posts/trefethen/2026-09-15-trefethen-09-matlab.md %}) | Comparison and experiment | `experiments/l09_eigen_primer.cpp` |
| 10 | [Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %}) | Algorithm and implementation | `nla::householder_qr` in `qr.*` |
| 11 | [Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md %}) | Algorithm and implementation | `nla::least_squares_qr` in `qr.*` |

## III — Conditioning and Stability

| L | Lecture | Focus | C++ verification / implementation plan |
|---:|---|---|---|
| 12 | [Conditioning and Condition Numbers]({% link _posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md %}) | Theory and derivation | `nla::condition_number_2` in `stability.*` |
| 13 | [Floating Point Arithmetic]({% link _posts/trefethen/2026-09-15-trefethen-13-floating-point-arithmetic.md %}) | Comparison and experiment | `experiments/l13_floating_point.cpp` |
| 14 | [Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %}) | Theory and derivation | `nla::linear_system_backward_error` in `stability.*` |
| 15 | [More on Stability]({% link _posts/trefethen/2026-09-15-trefethen-15-more-on-stability.md %}) | Theory and derivation | `experiments/l15_stability_composition.cpp` |
| 16 | [Stability of Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-16-stability-of-householder-triangularization.md %}) | Comparison and experiment | Householder QR diagnostics in `experiments/l16_householder_stability.cpp` |
| 17 | [Stability of Back Substitution]({% link _posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md %}) | Algorithm and implementation | `nla::back_substitution` in `systems.*` |
| 18 | [Conditioning of Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md %}) | Theory and derivation | `experiments/l18_least_squares_conditioning.cpp` |
| 19 | [Stability of Least Squares Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-19-stability-of-least-squares-algorithms.md %}) | Comparison and experiment | `experiments/l19_least_squares_solvers.cpp` |

## IV — Systems of Equations

| L | Lecture | Focus | C++ verification / implementation plan |
|---:|---|---|---|
| 20 | [Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %}) | Algorithm and implementation | `nla::lu_factor` in `systems.*` |
| 21 | [Pivoting]({% link _posts/trefethen/2026-09-15-trefethen-21-pivoting.md %}) | Algorithm and implementation | `nla::lu_factor_partial_pivoting` in `systems.*` |
| 22 | [Stability of Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-22-stability-of-gaussian-elimination.md %}) | Comparison and experiment | growth-factor diagnostics in `experiments/l22_growth_factor.cpp` |
| 23 | [Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %}) | Algorithm and implementation | `nla::cholesky` in `systems.*` |

## V — Eigenvalues

| L | Lecture | Focus | C++ verification / implementation plan |
|---:|---|---|---|
| 24 | [Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %}) | Theory and derivation | `experiments/l24_eigenvalue_conditioning.cpp` |
| 25 | [Overview of Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-25-overview-of-eigenvalue-algorithms.md %}) | Theory and derivation | Personal extension: `nla::power_iteration` in `eigenvalues.*` |
| 26 | [Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %}) | Algorithm and implementation | `nla::hessenberg_reduction` in `eigenvalues.*` |
| 27 | [Rayleigh Quotient, Inverse Iteration]({% link _posts/trefethen/2026-09-15-trefethen-27-rayleigh-quotient-inverse-iteration.md %}) | Algorithm and implementation | `nla::inverse_iteration` and `nla::rayleigh_quotient_iteration` |
| 28 | [QR Algorithm without Shifts]({% link _posts/trefethen/2026-09-15-trefethen-28-qr-algorithm-without-shifts.md %}) | Algorithm and implementation | `nla::qr_algorithm(..., false)` in `eigenvalues.*` |
| 29 | [QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %}) | Algorithm and implementation | `nla::qr_algorithm(..., true)` with shift and deflation |
| 30 | [Other Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-30-other-eigenvalue-algorithms.md %}) | Theory and derivation | Optional extension: compare one method in `experiments/l30_other_eigensolver.cpp` |
| 31 | [Computing the SVD]({% link _posts/trefethen/2026-09-15-trefethen-31-computing-the-svd.md %}) | Algorithm and implementation | Bidiagonalization in `eigenvalues.*`; a complete SVD solver is optional |

## VI — Iterative Methods

| L | Lecture | Focus | C++ verification / implementation plan |
|---:|---|---|---|
| 32 | [Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %}) | Comparison and experiment | `nla::LinearOperator` and `experiments/l32_matrix_free.cpp` |
| 33 | [The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %}) | Algorithm and implementation | `nla::arnoldi` in `iterative.*` |
| 34 | [How Arnoldi Locates Eigenvalues]({% link _posts/trefethen/2026-09-15-trefethen-34-how-arnoldi-locates-eigenvalues.md %}) | Theory and derivation | `experiments/l34_ritz_values.cpp` |
| 35 | [GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %}) | Algorithm and implementation | `nla::gmres` in `iterative.*` |
| 36 | [The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %}) | Algorithm and implementation | `nla::lanczos` in `iterative.*` |
| 37 | [From Lanczos to Gauss Quadrature]({% link _posts/trefethen/2026-09-15-trefethen-37-from-lanczos-to-gauss-quadrature.md %}) | Theory and derivation | `experiments/l37_gauss_quadrature.cpp` |
| 38 | [Conjugate Gradients]({% link _posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md %}) | Algorithm and implementation | `nla::conjugate_gradient` in `iterative.*` |
| 39 | [Biorthogonalization Methods]({% link _posts/trefethen/2026-09-15-trefethen-39-biorthogonalization-methods.md %}) | Algorithm and implementation | Bi-Lanczos in `iterative.*`; BiCG is an optional extension |
| 40 | [Preconditioning]({% link _posts/trefethen/2026-09-15-trefethen-40-preconditioning.md %}) | Algorithm and implementation | `nla::preconditioned_cg` in `iterative.*` |

## Next actions

- [ ] Derive the column expansion in [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %}) and work through a small example by hand.
- [ ] Implement `matvec_by_columns` and compare its results with Eigen.
- [ ] Record the actual code repository URL, commit, environment, commands, and results in the first note.
