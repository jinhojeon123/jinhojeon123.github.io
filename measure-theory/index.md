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

현재 다음 발표는 **Duality of Lp**이다. [Folland Seminar]({% link study/folland/index.md %})에서 새 Week와 prerequisite를 확인한다. 기존 글의 빈 section과 [수정 지시]({% link STUDY-REVIEW.md %})는 해당 문서에서 직접 완성한다.

[All mathematics notes]({{ '/notes/#mathematics' | relative_url }}) · [Numerical PDE and FEM project]({{ '/projects/numerical-pde-fem/' | relative_url }})
