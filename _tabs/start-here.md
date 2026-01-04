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


### Operating Systems

#### Processes & Threads
{% assign posts_proc = site.posts
  | where_exp: "p", "p.categories contains 'Operating Systems'"
  | where_exp: "p", "p.tags contains 'process'"
%}
{% if posts_proc.size > 0 %}
<ul>
  {% for post in posts_proc %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}

#### Synchronization & Concurrency
{% assign posts_sync = site.posts
  | where_exp: "p", "p.categories contains 'Operating Systems'"
  | where_exp: "p", "p.tags contains 'synchronization'"
%}
{% if posts_sync.size > 0 %}
<ul>
  {% for post in posts_sync %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}

#### Memory / Virtual Memory
{% assign posts_mem = site.posts
  | where_exp: "p", "p.categories contains 'Operating Systems'"
  | where_exp: "p", "p.tags contains 'virtual-memory'"
%}
{% if posts_mem.size > 0 %}
<ul>
  {% for post in posts_mem %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}

#### File Systems & I/O
{% assign posts_fs = site.posts
  | where_exp: "p", "p.categories contains 'Operating Systems'"
  | where_exp: "p", "p.tags contains 'filesystem'"
%}
{% if posts_fs.size > 0 %}
<ul>
  {% for post in posts_fs %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}

#### Scheduling
{% assign posts_sched = site.posts
  | where_exp: "p", "p.categories contains 'Operating Systems'"
  | where_exp: "p", "p.tags contains 'scheduling'"
%}
{% if posts_sched.size > 0 %}
<ul>
  {% for post in posts_sched %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}

#### Cache & Memory Hierarchy
{% assign posts_cache = site.posts
  | where_exp: "p", "p.categories contains 'Operating Systems'"
  | where_exp: "p", "p.tags contains 'cache'"
%}
{% if posts_cache.size > 0 %}
<ul>
  {% for post in posts_cache %}
    <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
{% else %}
- (추가 예정)
{% endif %}

