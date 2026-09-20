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

The next presentation is **Duality of Lp**. See [Folland Seminar]({% link study/folland/index.md %}) for the new weeks and prerequisites. Complete the empty sections and [revision tasks]({% link STUDY-REVIEW.md %}) directly in the relevant notes.

[All mathematics notes]({{ '/notes/#mathematics' | relative_url }}) · [Numerical PDE and FEM project]({{ '/projects/numerical-pde-fem/' | relative_url }})
