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


<div>
    {% for item in site.data.links.links %}
    <!-- TODO: implement with classes instead of hardcoded style -->    
    <div style="{% cycle '', 'background: #EEEEEE' %}">
        <div class="wideFlex">
            <!-- 
            <div class="" >
                {{ item.category }}
            </div>
            -->
            <div class="" >
                <h4>{{ item.title }}</h4>
            </div>
            <div class="" >
                <a href="https://{{ item.url}}">{{ item.url }}</a>
            </div>
        </div>
        <div class="" >
            {{ item.description }}
        </div>    
    </div>
    {% endfor %}
</div>
