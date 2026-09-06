---
layout: page
title: Research
icon: fas fa-microscope
order: 2
permalink: /research/
---

## Direction

I am interested in how the structure of a PDE and its discretization determines the solver, preconditioner, and parallel implementation. The current archive establishes mathematical prerequisites and the first iterative-solver notes. It does not yet contain a completed FEM/DD/MPI experiment campaign.

| Stage | Current evidence | Next question |
| --- | --- | --- |
| Foundations | [Measure theory and convergence]({{ '/measure-theory/' | relative_url }}) | Which functional-analytic assumptions are needed for a weak formulation? |
| Numerical methods | [Floating-point arithmetic]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) | How do stability and discretization error interact? |
| Solvers | [Steepest descent and CG]({{ '/projects/krylov-solvers/' | relative_url }}) | How does preconditioning change convergence and cost? |
| Parallel computing | [Planned sparse-computing project]({{ '/projects/parallel-sparse-computing/' | relative_url }}) | When do communication and global reductions dominate? |

## Experimental records

Each experiment should identify the question, mathematical assumptions, code repository and commit, machine and software environment, input data, exact command, accuracy criterion, and measured result. Failed or inconclusive experiments belong in the record too.

Timing results will include the number of repetitions and an aggregation rule. Solver comparisons will report stopping criteria and residual definitions alongside iteration counts. Scaling reports will distinguish strong from weak scaling and computation from communication.

{% assign experiments = site.posts | where: 'note_type', 'experiment' %}
{% assign logs = site.posts | where: 'note_type', 'research-log' %}
{% if experiments.size > 0 %}
<h2>Experiment reports</h2>
{% include note-list.html posts=experiments %}
{% endif %}
{% if logs.size > 0 %}
<h2>Research logs</h2>
{% include note-list.html posts=logs %}
{% endif %}
{% if experiments.size == 0 and logs.size == 0 %}
<p>No experiment reports or research logs are published yet. The <a href="{{ '/projects/' | relative_url }}">project indexes</a> identify the planned milestones.</p>
{% endif %}
