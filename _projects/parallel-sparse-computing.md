---
title: Parallel Sparse Computing
project_id: parallel-sparse-computing
status: Planned
order: 4
summary: Connect distributed sparse operations to communication costs and reproducible scaling measurements.
pathway: Domain partition → halo exchange → SpMV → global reductions → scaling
---

## Question

How much of an iterative solver's time is spent computing, communicating, and waiting for global reductions?

## Planned sequence

1. Specify matrix ownership, partitioning, and a serial reference result.
2. Implement halo exchange for distributed sparse matrix-vector products.
3. Add dot products and global reductions needed by a Krylov iteration.
4. Compare blocking and nonblocking communication after verifying correctness.
5. Measure strong and weak scaling, then connect the results to [domain decomposition]({{ '/projects/domain-decomposition/' | relative_url }}).

## Evidence to record

Record hardware, ranks, threads, placement and binding, compiler flags, MPI version, matrix size and nonzeros, repetitions, accuracy checks, and exact build/run commands. Separate compute, halo exchange, and reduction timings.

## Current evidence

This is a planned project. MPI/CMake source, timing data, and scaling figures will be linked when available.
