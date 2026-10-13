---
layout: page
title: Notes
date: 2026-09-07 02:43:10 +0900
icon: fas fa-book-open
order: 1
permalink: /notes/
---

Published notes follow four subject areas. Tags describe specific methods or tools; series and projects connect the reading order.

[Measure theory reading order]({{ '/measure-theory/' | relative_url }}) · [Categories]({{ '/categories/' | relative_url }}) · [Tags]({{ '/tags/' | relative_url }}) · [Chronological archive]({{ '/archives/' | relative_url }})

## Study roadmap

- [Complete study sequence]({% link STUDY-ROADMAP.md %})
- [Review of existing notes and remaining corrections]({% link STUDY-REVIEW.md %})

## Study series

{% include study-series.html %}

Each series index identifies prerequisites and provides an ordered reading path. The lists below contain published notes.

{% for area in site.data.taxonomy %}
<section aria-labelledby="{{ area.id }}">
  <h2 id="{{ area.id }}">{{ area.name }}</h2>
  <p>{{ area.description }}</p>
  {% assign area_notes = site.posts | where_exp: 'note', 'note.categories contains area.name' %}
  {% if area_notes.size > 0 %}
    {% include note-list.html posts=area_notes %}
  {% else %}
    <p>No notes published in this area yet.</p>
  {% endif %}
</section>
{% endfor %}
