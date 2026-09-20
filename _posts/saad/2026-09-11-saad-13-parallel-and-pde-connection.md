---
layout: post
title: "Saad 13 — Parallel / PDE Connection"
permalink: /study/saad/13-parallel-and-pde-connection/
math: true
toc: true
status: outline
date: 2026-09-11 00:00:00 +0900
categories: [Solvers]
tags: [numerical-linear-algebra, iterative-methods, saad]
note_type: numerical-method
series: saad
series_order: 14
---

Source scope: Saad, 2nd ed. (2003), Chs. 2, 11–12

## Prerequisite

- [Sparse Linear Systems]({% link _posts/saad/2026-09-11-saad-01-sparse-linear-systems.md %})
- [Basic Preconditioners]({% link _posts/saad/2026-09-11-saad-10-basic-preconditioners.md %})
- [Convergence and Spectral Interpretation]({% link _posts/saad/2026-09-11-saad-12-convergence-and-spectral-interpretation.md %})
- [Bridge to Numerical PDE]({% link _posts/linear-algebra-review/2026-09-11-linear-algebra-19-bridge-to-numerical-pde.md %})

Dependency: [12]({% link _posts/saad/2026-09-11-saad-12-convergence-and-spectral-interpretation.md %}) → 13 → [14]({% link _posts/saad/2026-09-11-saad-14-domain-decomposition-bridge.md %})

## Problem being solved

## Required definitions

## PDE connection

### PDE discretization

### Relationship between Krylov methods and PDE discretization

## Parallel operations

### Sparse SpMV

### Distributed vector

### Halo exchange

### Dot products

### Global reductions

### Local versus global communication

## Derivation

## Main theorem / property

## Proofs / Proof ideas

## Algorithm

## Convergence

## Examples / Counterexamples

## Numerical interpretation

## Implementation issues

### Partitioning

### Parallel preconditioners

### Strong / weak scaling

### Accuracy and reproducibility

## Existing notes / Project connections

- [Parallel Sparse Computing project]({% link _projects/parallel-sparse-computing.md %})
- [Numerical PDE / FEM project]({% link _projects/numerical-pde-fem.md %})

## Connection to next topic

- [Domain Decomposition Bridge]({% link _posts/saad/2026-09-11-saad-14-domain-decomposition-bridge.md %})

## Questions

## Final reconstruction
