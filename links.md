---
layout: post
title: links
subtitle: Other Domains of Interest
description: Offsite Interests
tags: [links]
comments: false
permalink: /links/
---

# Links

Right now, this is just a list. 

If there is any interest in expansion, some commentary will be added, and will be expanded with category organized search features.

<table cellpadding=".25em" cellspacing="0" border="0" >
{% for item in site.data.links.links %}


    <tr style="{% cycle '', 'background: #EEEEEE' %}">
        <td style="color: #999999">{{ item.category }}</td>
        <td style="font-weight:bold">{{ item.title }}</td>
        <td><a href="https://{{ item.url }}">[ {{ item.url }} ]</a></td>
        <td>{{ item.description }}</td>
    </tr>


{% endfor %}
</table>

