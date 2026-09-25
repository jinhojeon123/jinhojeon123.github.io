---
layout: page
title: Notes
date: 2026-09-07 02:43:10 +0900
icon: fas fa-book-open
order: 1
permalink: /notes/
---

Notes follow four subject areas. Tags describe specific methods or tools; series and projects connect the reading order. **Working note** means work in progress; **outline** means a study plan with incomplete sections.

[Measure theory reading order]({{ '/measure-theory/' | relative_url }}) · [Categories]({{ '/categories/' | relative_url }}) · [Tags]({{ '/tags/' | relative_url }}) · [Chronological archive]({{ '/archives/' | relative_url }})

## Study roadmap

- [Complete study sequence]({% link STUDY-ROADMAP.md %})
- [Review of existing notes and remaining corrections]({% link STUDY-REVIEW.md %})

## Study series

{% include study-series.html %}

Each series index identifies prerequisites and provides an ordered reading path. Outlines also appear under **Study outlines** below, Categories, Tags, Archives, and search.

{% for area in site.data.taxonomy %}
<section aria-labelledby="{{ area.id }}">
  <h2 id="{{ area.id }}">{{ area.name }}</h2>
  <p>{{ area.description }}</p>
  {% assign area_notes = site.posts | where_exp: 'note', 'note.categories contains area.name' %}
  {% assign developed = area_notes | where_exp: 'note', 'note.status != "outline"' %}
  {% assign outlines = area_notes | where: 'status', 'outline' | sort: 'date' %}
  {% if developed.size > 0 %}
    {% include note-list.html posts=developed %}
  {% else %}
    <p>No developed notes published in this area yet.</p>
  {% endif %}
  {% if outlines.size > 0 %}
    <details><summary>Study outlines ({{ outlines.size }})</summary>
    {% for series in site.data.study_series %}
      {% assign series_outlines = outlines | where: 'series', series.id | sort: 'series_order' %}
      {% if series_outlines.size > 0 %}
        <h3 class="outline-group"><a href="{{ series.url | relative_url }}">{{ series.title | escape }}</a> <span class="note-meta">in reading order</span></h3>
        {% include note-list.html posts=series_outlines meta=false %}
      {% endif %}
    {% endfor %}
    {% assign series_ids = site.data.study_series | map: 'id' %}
    {% assign other_outlines = '' | split: '' %}
    {% for note in outlines %}{% unless series_ids contains note.series %}{% assign other_outlines = other_outlines | push: note %}{% endunless %}{% endfor %}
    {% if other_outlines.size > 0 %}
      <h3 class="outline-group">Other outlines</h3>
      {% include note-list.html posts=other_outlines meta=false %}
    {% endif %}
    </details>
  {% endif %}
</section>
{% endfor %}
