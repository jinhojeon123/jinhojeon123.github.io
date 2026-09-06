---
layout: page
title: Notes
icon: fas fa-book-open
order: 1
permalink: /notes/
---

Notes follow four subject areas. Tags describe specific methods or tools; series and projects connect the reading order. **Working note** means work in progress; **outline** means a study plan with incomplete sections.

[Measure theory reading order]({{ '/measure-theory/' | relative_url }}) · [Categories]({{ '/categories/' | relative_url }}) · [Tags]({{ '/tags/' | relative_url }}) · [Chronological archive]({{ '/archives/' | relative_url }})

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
    <details><summary>Study outlines ({{ outlines.size }})</summary>{% include note-list.html posts=outlines %}</details>
  {% endif %}
</section>
{% endfor %}
