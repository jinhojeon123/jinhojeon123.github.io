---
layout: post
title: "Saad 11 — Nonsymmetric Krylov Methods"
permalink: /study/saad/11-nonsymmetric-krylov-methods/
math: true
toc: true
status: outline
date: 2026-09-11 00:00:00 +0900
categories: [Solvers]
tags: [numerical-linear-algebra, iterative-methods, saad]
note_type: numerical-method
series: saad
series_order: 12
---

Source scope: Saad, 2nd ed. (2003), Ch. 7; Ch. 8 connection

## Prerequisite

- [GMRES]({% link _posts/saad/2026-09-11-saad-06-gmres.md %})
- [Lanczos]({% link _posts/saad/2026-09-11-saad-07-lanczos.md %})
- [Basic Preconditioners]({% link _posts/saad/2026-09-11-saad-10-basic-preconditioners.md %})
- [Special Matrix Classes]({% link _posts/linear-algebra-review/2026-09-11-linear-algebra-09-special-matrix-classes.md %})
- [Schur Decomposition]({% link _posts/linear-algebra-review/2026-09-11-linear-algebra-15-schur-decomposition.md %})

Dependency: [10]({% link _posts/saad/2026-09-11-saad-10-basic-preconditioners.md %}) → 11 → [12]({% link _posts/saad/2026-09-11-saad-12-convergence-and-spectral-interpretation.md %})

## Problem being solved

## Required definitions

### Two-sided Lanczos

### Biorthogonality

### Shadow residual

## Derivation

## Main theorem / property

### Comparison with GMRES

### Breakdown versus near-breakdown

## Proofs / Proof ideas

## Algorithm

### BiCG

### CGS

### BiCGSTAB

### QMR

## Convergence

## Examples / Counterexamples

## Numerical interpretation

## Implementation issues

## Connection to normal equations

### CGNR / CGNE

### Conditioning

### Normal-equation methods → Ch. 8

## Connection to next topic

- [Convergence and Spectral Interpretation]({% link _posts/saad/2026-09-11-saad-12-convergence-and-spectral-interpretation.md %})

## Questions

## Final reconstruction
