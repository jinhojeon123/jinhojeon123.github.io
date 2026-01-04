---
icon: fas fa-map-signs
order: 2
title: Start Here
---

# Contents
- [Numerical Analysis](#numerical-analysis)
- [Operating Systems](#operating-systems)

---

## Numerical Analysis

### Floating-point & Stability
{% raw %}
{% assign posts_fp = site.posts | where_exp: "p", "p.categories contains 'Numerical Analysis'" | where_exp: "p", "p.tags contains 'floating-point'" %}
{% if posts_fp.size > 0 %}
<ul>
{% for post in posts_fp %}
  <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}
{% endraw %}

---

### Iterative Methods & Linear Algebra
{% raw %}
{% assign posts_iter = site.posts | where_exp: "p", "p.categories contains 'Numerical Analysis'" | where_exp: "p", "p.tags contains 'iterative-methods'" %}
{% if posts_iter.size > 0 %}
<ul>
{% for post in posts_iter %}
  <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}
{% endraw %}

---

### FEM / PDE
{% raw %}
{% assign posts_fem = site.posts | where_exp: "p", "p.categories contains 'Numerical Analysis'" | where_exp: "p", "p.tags contains 'fem'" %}
{% if posts_fem.size > 0 %}
<ul>
{% for post in posts_fem %}
  <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}
{% endraw %}

---

## Operating Systems

### Processes / Threads
{% raw %}
{% assign posts_proc = site.posts | where_exp: "p", "p.categories contains 'Operating Systems'" | where_exp: "p", "p.tags contains 'process'" %}
{% if posts_proc.size > 0 %}
<ul>
{% for post in posts_proc %}
  <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}
{% endraw %}

---

### Memory / Virtual Memory
{% raw %}
{% assign posts_mem = site.posts | where_exp: "p", "p.categories contains 'Operating Systems'" | where_exp: "p", "p.tags contains 'virtual-memory'" %}
{% if posts_mem.size > 0 %}
<ul>
{% for post in posts_mem %}
  <li><a href="{{ post.url }}">{{ post.title }}</a></li>
{% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}
{% endraw %}
