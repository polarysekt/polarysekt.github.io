---
layout: article
title: tags
permalink: /tags/
---

{% for tag in site.tags %}
  <h3>{{ tag[0] }}</h3>
  <ul>
    {% for post in tag[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a>
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
    {% endfor %}
  </ul>
{% endfor %}
