---
layout: page
title: "Saad Study"
permalink: /study/saad/
math: true
toc: true
status: outline
---

# Saad Study

Reference edition: Yousef Saad, *Iterative Methods for Sparse Linear Systems*, 2nd ed. (2003).

Source: [Author's public copy](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf) · [Edition and errata](https://www-users.cse.umn.edu/~saad/books.html)

[Complete roadmap]({% link STUDY-ROADMAP.md %})

## Study order / Book mapping

| Order | Topic | Book scope |
| --- | --- | --- |
| 00 | [Prerequisites]({% link _posts/saad/2026-09-11-saad-00-prerequisites.md %}) | Ch. 1 |
| 01 | [Sparse Linear Systems]({% link _posts/saad/2026-09-11-saad-01-sparse-linear-systems.md %}) | Ch. 3 |
| 02 | [Stationary Iterative Methods]({% link _posts/saad/2026-09-11-saad-02-stationary-iterative-methods.md %}) | Ch. 4 |
| 03 | [Projection Methods]({% link _posts/saad/2026-09-11-saad-03-projection-methods.md %}) | Ch. 5 |
| 04 | [Krylov Subspaces]({% link _posts/saad/2026-09-11-saad-04-krylov-subspaces.md %}) | §6.2 |
| 05 | [Arnoldi]({% link _posts/saad/2026-09-11-saad-05-arnoldi.md %}) | §§6.3–6.4 |
| 06 | [GMRES]({% link _posts/saad/2026-09-11-saad-06-gmres.md %}) | §6.5; §6.11.4 |
| 07 | [Lanczos]({% link _posts/saad/2026-09-11-saad-07-lanczos.md %}) | §6.6 |
| 08 | [Conjugate Gradient]({% link _posts/saad/2026-09-11-saad-08-conjugate-gradient.md %}) | §6.7; §6.11.3 |
| 09 | [Preconditioning]({% link _posts/saad/2026-09-11-saad-09-preconditioning.md %}) | Ch. 9 |
| 10 | [Basic Preconditioners]({% link _posts/saad/2026-09-11-saad-10-basic-preconditioners.md %}) | Ch. 10; §12.2 |
| 11 | [Nonsymmetric Krylov Methods]({% link _posts/saad/2026-09-11-saad-11-nonsymmetric-krylov-methods.md %}) | Ch. 7; Ch. 8 connection |
| 12 | [Convergence and Spectral Interpretation]({% link _posts/saad/2026-09-11-saad-12-convergence-and-spectral-interpretation.md %}) | §6.11; §1.9 |
| 13 | [Parallel / PDE Connection]({% link _posts/saad/2026-09-11-saad-13-parallel-and-pde-connection.md %}) | Chs. 2, 11–12 |
| 14 | [Domain Decomposition Bridge]({% link _posts/saad/2026-09-11-saad-14-domain-decomposition-bridge.md %}) | Ch. 14; Ch. 13 connection |

## Dependency

[Linear Algebra prerequisites]({% link _posts/saad/2026-09-11-saad-00-prerequisites.md %}) → Stationary → Projection → Krylov → Arnoldi / Lanczos → GMRES / CG → Preconditioning → Domain Decomposition

## Ordering notes

- Review Ch. 1 → [Linear Algebra Review]({% link study/linear-algebra/index.md %})
- Revisit the nonsymmetric methods of Ch. 7 in unit 11, after preconditioning in Chs. 9–10, following the requested study sequence.
- Ch. 8 → the normal-equation connection in unit 11.
- Ch. 2 → the PDE connection in unit 13.
- Ch. 12 → block Jacobi in unit 10 and parallel preconditioners in unit 13.
- Ch. 13 → the multigrid connection in unit 14.
- RAS / coarse correction / two-level extensions → headings in unit 14; TODO: verify separate references.

## Current next action

- [ ] [00. Prerequisites]({% link _posts/saad/2026-09-11-saad-00-prerequisites.md %})
