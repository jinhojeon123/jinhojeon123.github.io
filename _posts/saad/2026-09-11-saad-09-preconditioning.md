---
layout: post
title: "Saad 09 — Preconditioning"
permalink: /study/saad/09-preconditioning/
math: true
toc: true
status: outline
date: 2026-09-11 00:00:00 +0900
categories: [Solvers]
tags: [numerical-linear-algebra, iterative-methods, saad]
note_type: numerical-method
series: saad
series_order: 10
---

Source scope: Saad, 2nd ed. (2003), Ch. 9

## Prerequisite

- [GMRES]({% link _posts/saad/2026-09-11-saad-06-gmres.md %})
- [Conjugate Gradient]({% link _posts/saad/2026-09-11-saad-08-conjugate-gradient.md %})
- [Spectral Theorem]({% link _posts/linear-algebra-review/2026-09-11-linear-algebra-10-spectral-theorem.md %})
- [Conditioning]({% link _posts/linear-algebra-review/2026-09-11-linear-algebra-13-conditioning.md %})
- [Matrix Factorizations]({% link _posts/linear-algebra-review/2026-09-11-linear-algebra-14-matrix-factorizations.md %})

Dependency: [08]({% link _posts/saad/2026-09-11-saad-08-conjugate-gradient.md %}) → 09 → [10]({% link _posts/saad/2026-09-11-saad-10-basic-preconditioners.md %})

## Problem being solved

## Required definitions

### Left preconditioning

### Right preconditioning

### Split / symmetric preconditioning

### Transformed system

## Derivation

## Main theorem / property

### Spectral viewpoint

### What makes a good preconditioner

### Symmetry and definiteness preservation

## Proofs / Proof ideas

## Algorithm

### Preconditioned CG

### Preconditioned GMRES

### Flexible GMRES

## Convergence

## Examples / Counterexamples

## Numerical interpretation

## Implementation issues

### Applying inverse through solves

### True versus preconditioned residual

## Connection to next topic

- [Basic Preconditioners]({% link _posts/saad/2026-09-11-saad-10-basic-preconditioners.md %})

## Questions

## Final reconstruction
