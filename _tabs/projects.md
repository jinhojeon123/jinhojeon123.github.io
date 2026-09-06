---
layout: page
title: Projects
icon: fas fa-diagram-project
order: 3
permalink: /projects/
---

Each project connects a mathematical question to methods, code, and experiments. **Study in progress** means linked notes exist. **Planned** means the scope is defined but no project results have been published.

{% assign ordered_projects = site.projects | sort: 'order' %}
{% for project in ordered_projects %}
<section>
  <h2><a href="{{ project.url | relative_url }}">{{ project.title }}</a></h2>
  <p class="note-meta">{{ project.status }}</p>
  <p>{{ project.summary }}</p>
  <p>{{ project.pathway }}</p>
</section>
{% endfor %}
