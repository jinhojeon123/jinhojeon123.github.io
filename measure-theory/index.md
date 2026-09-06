---
layout: page
title: Measure Theory Notes
permalink: /measure-theory/
math: true
---

The series connects measurable structures and measure construction to integration, convergence theorems, and function spaces. **Outline** marks unfinished material; seminar notes may also contain open proof steps.

## Reading order

{% assign series_notes = site.posts | where: 'series', 'measure-theory' | sort: 'series_order' %}
{% include note-list.html posts=series_notes %}

## Continuing the study

Topics still to develop include the construction of the integral, modes of convergence, product measures, Tonelli and Fubini theorems, and the functional-analytic foundations used in weak formulations.

[All mathematics notes]({{ '/notes/#mathematics' | relative_url }}) · [Numerical PDE and FEM project]({{ '/projects/numerical-pde-fem/' | relative_url }})
