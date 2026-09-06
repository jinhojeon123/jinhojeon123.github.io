---
title: Numerical PDE and FEM
project_id: numerical-pde-fem
status: Planned
order: 1
summary: Connect a boundary-value problem to a weak formulation, finite elements, and a sparse linear system.
pathway: PDE → weak formulation → FEM → sparse linear system
---

## Question

How do the mathematical assumptions behind a weak formulation appear in the assembled system and its numerical error?

## Planned sequence

1. Choose a model elliptic problem, boundary conditions, and a manufactured solution.
2. State the function spaces, weak formulation, and well-posedness assumptions.
3. Derive a finite-element discretization and implement assembly.
4. Check boundary treatment, matrix structure, and mesh convergence.
5. Pass the assembled system to the [solver project]({{ '/projects/krylov-solvers/' | relative_url }}).

## Evidence to record

Keep the mesh family, element order, quadrature choice, norms, solver tolerance, and observed errors with the exact source commit and run commands. Separate discretization error from algebraic solver error.

## Current evidence

This is a planned project. There is no published FEM implementation or convergence table yet. [Measure theory notes]({{ '/measure-theory/' | relative_url }}) provide part of the mathematical study background; Sobolev-space notes remain unfinished.
