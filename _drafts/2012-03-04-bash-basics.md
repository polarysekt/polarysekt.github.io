---
layout: post
title: bash basics
description: Getting started with bash
author: polarysekt
modified: 2019-09-15
tags: [bash, shell, terminal, console]
---



NOTE: `~` is an easy reference for home in most standard shells. The full path is `/home/<USERNAME>/` where `<USERNAME>` is the name of the user, assuming your system follows these path paradigms. 


Auto completion

commands in a shell can be autocompleted by pressing TAB.

REMINDER: You should not be operating as `root`, using `sudo`, or any user of elevated privilege. 

-Hence, the `$` prompt.

Example 1a (Subfolder in `/home/`):
````
$ mkdir ~/checkouts
$ cd ~/checkouts
````

Example 1b (Different Subfolder in `/home/`):
````
$ mkdir ~/[co]
$ cd ~/[co]
````

Example 2 (Using `/home/`):
````
$ cd
```` 