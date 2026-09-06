---
title: "Replace with a descriptive numerical method title"
date: YYYY-MM-DD 00:00:00 +0900
categories: [Numerical Methods]
tags: []
description: "Replace with the problem, method, and evidence included."
status: working-note
note_type: numerical-method
math: true
# equation_numbering: ams # Optional: enable AMS equation labels and references.
toc: true
permalink: /posts/replace-with-stable-slug/
published: false
projects: []
references: []
---

<!-- Choose Solvers for a linear-system solver. Known project IDs:
numerical-pde-fem, krylov-solvers, domain-decomposition, parallel-sparse-computing.
Select only relevant IDs. Replace placeholders before removing published:false. -->

## Problem and motivation

State the mathematical problem, baseline method, and desired improvement.

## Mathematical setup and assumptions

Define operators or matrices, spaces, boundary conditions, and the norm used.

## Derivation

Connect the original problem to the discrete equations or iteration.

## Key result and scope

State consistency, stability, convergence, or another relevant result with its
assumptions. Separate exact-arithmetic theory from floating-point behavior.

### Proof or proof sketch

Give the argument or identify the source and the steps still to be understood.

## Algorithm

```text
Inputs: replace with data and assumptions
Initialization: replace with initial state
Iteration: replace with mathematical steps
Stopping condition: replace with a defined norm and tolerance
Outputs: replace with the computed quantity and diagnostics
```

## Implementation

Link the actual source file and commit, or explicitly state that implementation
is planned. Use `matlab`, `python`, or `cpp` fences for executable code. Describe
data structures, boundary treatment, and failure reporting where relevant.

## Experiment

Record problem size, environment, tolerances, exact commands, and raw-data location.
Define error and residual metrics. Report results only after running the experiment.

## What can go wrong?

Discuss invalid assumptions, conditioning, stopping criteria, numerical breakdown,
and the computational cost relevant to this method.

## Connections and next steps

Link the prerequisite, a comparison method, and the related project index.

{% include bibliography.html %}
