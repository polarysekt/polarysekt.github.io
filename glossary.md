---
layout: article
title: glossary
subtitle: A straight list of terms
description: A relatively terse, almost unmanageable list
tags: [glossary, jargon, vernacular]
comments: false
permalink: /reference/glossary/
---


The following [jargon](#jargon) is used frequently (and without warning), so it should be in the [vernacular](#vernacular)...


## Terms
<div>
{% for item in site.data.glossary.terms %}
    <a name="{{ item.term }}"></a>
    <p>
        <b>{{ item.term }}</b> - {{ item.meaning }}
    </p>
{% endfor %}
</div>

## Abbreviations
<div>
{% for item in site.data.glossary.abbreviations %}
    <a name="{{ item.term }}"></a>
    <p>
        <b>{{ item.term }}</b> - {{ item.meaning }}
    </p>
{% endfor %}
</div>


## Acronyms
<div>
{% for item in site.data.glossary.acronyms %}
    <a name="{{ item.term }}"></a>
    <p>
        <b>{{ item.term }}</b> - {{ item.meaning }}
    </p>
{% endfor %}
</div>
