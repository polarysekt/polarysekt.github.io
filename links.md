---
layout: post
title: links
subtitle: Other Domains of Interest
description: Offsite Interests
tags: [links]
comments: false
permalink: /links/
---

{% for item in site.data.links.links %}
![](https://{{ item.url }}/favicon.ico)

{{ item.title }}

[https://{{ item.url}}]({{ item.url }})

{{ item.description }}



{% endfor %}
