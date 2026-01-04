---
layout: page
title: Start Here
permalink: /start-here/
---

## Contents

### Numerical Analysis

#### Floating-point & Stability
{% assign posts_fp = site.posts
  | where_exp: "p", "p.categories contains 'Numerical Analysis'"
  | where_exp: "p", "p.tags contains 'floating-point'"
%}

{% if posts_fp.size > 0 %}
<ul>
  {% for post in posts_fp %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}
