---
layout: article
title: articles
subtitle: Index of Articles
description: this is the unabridged list
tags: [article]
comments: none
permalink: /articles/
---

{%- if site.posts.size > 0 -%}
<section class="listing">
  <div class="wideFlex alignMiddle">  
  <h1>{{ page.list_title | default: "Posts" }}</h1>
  <div class="feed-subscribe"><a href="{{ "/feed.xml" | relative_url }}"><i class="fas fa fa-rss"></i> Subscribe</a></div>
</div>
  <ul>
    {%- for post in site.posts -%}
    <li><a class="listing-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
    {%- if site.show_excerpts -%}
      <h2>{{ post.excerpt }}</h2>
    {%- endif -%}
    {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
    <h6>
      {{ post.date | date: date_format }}
      {%- if post.modified -%}
      &nbsp;|&nbsp;{{ post.modified | date: date_format }}
      {%- endif -%}
    </h6>
    </li>
    {%- endfor -%}
  </ul>

</section>
{%- endif -%}
