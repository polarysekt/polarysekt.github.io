---
layout: post
---

Static site generators are incredibly useful for deploying documentation, as the focus is more on the content than bleeding edge web features.

While it is important for a site to appear somewhat modern, and be responsive enough to handle the many different media types on which they are displayed, keep in mind that some users are just interested in what it has to say.
The site content should still be available to users without or who have disabled javascript.

It is often helpful to view a site with a text-only or console-based browser, such as `links`.

## Github Pages

[https://www.github.com](https://www.github.com)

One free option for free static site hosting is github.

Github provides a convenient continuous deployment strategy for static sites, especially geared for product pages and documentation.

There are a few ways to implement

Github pages, often known as `gh-pages` are integrated into the workflow in a few different ways.

A user page, hosted at <username>.github.io is a different topic we'll address later.

The two primary ways to implement the static builder are:

1. Using the `gh-pages` branch

1. Using a `docs/` folder in the project.

For now, we can focus on the latter, as a `docs` folder is usually going to be integrated directly into a project workflow.

### Jekyll

Jekyll uses ruby `Gemfiles` and `yaml` files for configuration, so a brief overview of their syntax should be explored.

While perhaps not enough to warrant digging in to an IDE, it is generally helpful to use an editor that recognizes and highlights these syntaxes to catch mistakes early.

A step further is to use an IDE with integrated completion that can provide tips and fixes for common errors.

Visual Studio Code works well, because it is free, contains plenty of helpful extensions, and incorporates the `git` procedures directly into the interface.

`yaml` or `yml` files are commonly used for configuration. 

While in some cases it is good to have these contained in a folder, or at least out of the clutter of the project root, it is often better to put them in the default search location of the tool(s) being used.

Jekyll expects to find a _config.yaml file in the project root, so we'll create it there.

The syntax isn't too difficult, but it's easy to make whitespace mistakes. Here is a good example of when spaces are (must) be used instead of tabs.
The editor of choice will generally provide at the very least a mechanism for 'tabbed' indentation using spaces.


```
name: value

array: [ list, of, values ]

array:
 - list
 - of
 - values

```

Also important is front matter, which is essentially some metadata prepended to a file.


```
---
title:       mypage
description: a description of my page
layout:      default
---

```
Usually default values for omitted variables in the files are provided by the _config.yaml.
The values used in the files will take precedence.
At the very least, even if no variables are required, front matter is still expected by the parser, so would be included as a blank header.


```
---
---

file content here


```



