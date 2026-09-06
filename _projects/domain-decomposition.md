---
title: Domain Decomposition
project_id: domain-decomposition
status: Planned
order: 3
summary: Study local solves, overlap, and coarse spaces as preconditioners for discretized PDEs.
pathway: Block Jacobi → ASM / RAS → two-level methods → coarse space
---

## Question

How do overlap and a coarse correction affect convergence, setup cost, and parallel communication?

## Planned sequence

1. Establish a block-Jacobi baseline for a system from the [FEM project]({{ '/projects/numerical-pde-fem/' | relative_url }}).
2. Define restriction, extension, overlap, and local subdomain operators.
3. Implement additive and restricted additive Schwarz (ASM/RAS).
4. Add a two-level correction and state the coarse-space construction.
5. Evaluate convergence and communication with the [parallel sparse-computing project]({{ '/projects/parallel-sparse-computing/' | relative_url }}).

## Evidence to record

Report the partition, overlap width, number of subdomains, local solver, coarse-space dimension, outer Krylov method, residual criterion, and timings. State symmetry and definiteness assumptions when selecting the outer solver.

## Current evidence

This is a planned project; no ASM/RAS implementation, coarse-space experiment, or scaling claim is published here yet.
