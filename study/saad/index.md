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

Source: [저자 공개본](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf) · [판본 및 errata](https://www-users.cse.umn.edu/~saad/books.html)

[전체 roadmap]({% link STUDY-ROADMAP.md %})

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

- Ch. 1 복습 → [Linear Algebra Review]({% link study/linear-algebra/index.md %})
- Ch. 7의 nonsymmetric methods → 요청한 학습 순서에 따라 Chs. 9–10의 preconditioning을 공부한 뒤 11번에서 복습.
- Ch. 8 → 11의 normal-equation connection.
- Ch. 2 → 13의 PDE connection.
- Ch. 12 → 10의 block Jacobi 및 13의 parallel preconditioners.
- Ch. 13 → 14의 multigrid connection.
- RAS / coarse correction / two-level 확장 → 14의 heading; 별도 reference 확인 TODO.

## Current next action

- [ ] [00. Prerequisites]({% link _posts/saad/2026-09-11-saad-00-prerequisites.md %})
