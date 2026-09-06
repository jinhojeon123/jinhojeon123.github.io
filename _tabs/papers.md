---
layout: page
title: Papers
icon: fas fa-file-lines
order: 4
permalink: /papers/
---

Paper notes connect a source's assumptions, mathematical formulation, algorithms, and experiments to a project. Each note should distinguish the paper's claims from my interpretation, implementation ideas, and unresolved questions.

{% assign papers = site.posts | where: 'note_type', 'paper-note' %}
{% if papers.size > 0 %}
{% include note-list.html posts=papers %}
{% else %}
No paper notes have been published yet. References already present in technical notes remain with those notes.
{% endif %}

## Reading questions

- What problem does the paper solve, and why do its assumptions matter?
- What mathematical result explains the algorithm?
- What do the numerical experiments establish, and what remains untested?
- Which part can be reproduced or adapted to [a project]({{ '/projects/' | relative_url }})?

Notes will include a complete citation and source link, open questions, and a project connection when relevant.
