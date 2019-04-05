---
layout: post
title: libGH
author: polarysekt
---

This continuously updated post will be all about libGH, creation, destruction, rebuilding, and building with.

Forgetting Everything.

It's so easy to lose focus, to leave the zone.

The zone can be rewarding, as well as dangerous.

&nbsp;
<h2>Setting up a (the) Build System</h2>
Initially, libGH was built haphazardly with no <a href="https://kb3c.wordpress.com/glossary/" target="_blank">makefile</a>s whatsoever (yes, it was initially developed in a, ugh, <a href="https://kb3c.wordpress.com/glossary/" target="_blank">IDE</a>).

Soon, the whole <a href="https://kb3c.wordpress.com/glossary/" target="_blank">IDE</a> concept was deprecated, and a hand-crafted <a href="https://kb3c.wordpress.com/glossary/" target="_blank">makefile</a> came into play.

&nbsp;
<h3>Autotools</h3>
Don't get me wrong; Autotools is nice, but seriously heavy!

If the headache of initial setup weren't enough, there was the whole balance of keeping Automake up to date with the development process.
<h3>CMake</h3>
Currently, CMake is the build system of choice for libGH.