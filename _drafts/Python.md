---
layout: post
title: python
author: polarysekt
---

Getting back into the python devcycle.

One difficulty new developers encounter while starting out with python is the versioning.

As of the time of this writing, most systems will contain both a `python2` and a `python3` executable with a symlink `python`.

You can check the currently linked version with:

```shell
$ python --version
```

Keeping track of the development environment by hand quickly becomes a tedious chore.

From here on out, `python` means `python3`, and `pip` means `pip3`.

In order to set these, we should set environment variables. However, we do not want to make these changes global to our system, in case other projects or programs are using different versions of python.

## Virtual Environment

Enter `virtualenv`.

Using a virtual environment helps tremendously, especially when developing with a team and when using different machines.

>**Usage:** virtualenv [OPTIONS] DEST_DIR

**Examples:**
python 3
```
$ virtualenv -p /usr/bin/python3 .
```
python 3.7
```
$ virtualenv -p /usr/bin/python3 .
```
Don't forget to specify `DEST_DIR`, in this case, `.`.

The files will be generated in a subfolder named `venv`.
Go ahead and enter the virtual environment. 
By default, the shell prompt prefix is the current folder.  Customize using the `--prompt=PROMPT` option when creating the virtual environment.

`$ source  venv/bin/activate`

To clear the environment (start over):

```
$ virtualenv --clear .
```

Again, the `DEST_DIR` argument is required.

For the full command syntax, use `virtualenv --help`, or see [the appendix](#virtualenv).

Dependencies:

A standard way of keeping track of dependencies is to use a `requirements.txt` file.

This crops up again when it's time to deploy.


## Linting

Simple linting with pylint.


## Unit Testing

Unit testing with `nose`.

Raising exceptions.

Similar to other unit testing frameworks, tests are written such that they raise exceptions and fail when tests don't pass.

While for simple projects it may be tempting to write some simple tests that provide output to be human checked, it's good to get into the habit of writing thorough unit tests early, so it doesn't become a problem when a project becomes complex.


## Documentation

Documentation should never be taken lightly.

It's a good idea to determine a strategy for documentation while the project is still young.

Putting this off now is only going to lead to more hassle later.

While hand writing documentation and listing functionality may suffice for small projects, it quickly spirals out of hand when the project grows and inevitable changes to functionality occur.

Most development workflows incorporate some sort of header tagging that can be parsed automatically by a tool during a build process.

A good pipeline usually involves some compatible intermediary formats.

### Manpages

On unix systems, manual pages are important, especially to users on headless, or at least non-graphical systems.


### Static Website

While it still shouldn't be an afterthought, the product website usually isn't going to get a lot of programmer time.

It's usually a good idea to use a static site generator.

You can take a look at some notes I've taken on the subject.


## Deployment

Many popular git hosts have integrated automated deployment into the devcycle.

For now, we will focus on deploying from the local dev machine to get the fundamentals right before attempting automation.


### Heroku

[https://www.heroku.com](https://www.heroku.com)

Heroku is a good place to start because it's easy to get up and running without much configuration hassle.

It also doesn't hurt that it provides free services to try out before dedicating to a solution.


## Appendix

### Commandline Syntax

#### **virtualenv**

>Usage: virtualenv [OPTIONS] DEST_DIR
>
>Options:
>
> **--version**             show program's version number and exit
>
>** -h**, **--help**            show this help message and exit
>
>**-v**, **--verbose**         Increase verbosity.
> 
>**-q**, **--quiet**          Decrease verbosity.
>
>**-p** *PYTHON_EXE*, **--python**=*PYTHON_EXE*
                        The Python interpreter to use, e.g.,
                        --python=python2.5 will use the python2.5 interpreter
                        to create the new environment.  The default is the
                        python2 interpreter on your path (e.g.
                        /usr/bin/python2)
>
>**--clear**               Clear out the non-root install and start from scratch.
>
>**--no-site-packages**    DEPRECATED. Retained only for backward compatibility.
                        Not having access to global site-packages is now the
                        default behavior.
>
>**--system-site-packages**
                        Give the virtual environment access to the global
                        site-packages.
>
>**--always-copy**         Always copy files rather than symlinking.
>
>**--unzip-setuptools**    Unzip Setuptools when installing it.
>
>**--relocatable**         Make an EXISTING virtualenv environment relocatable.
                        This fixes up scripts and makes all .pth files
                        relative.
>
>**--no-setuptools**       Do not install setuptools in the new virtualenv.
>
>**--no-pip**              Do not install pip in the new virtualenv.
>
>**--no-wheel**            Do not install wheel in the new virtualenv.
>
>**--extra-search-dir**=*DIR*
                        Directory to look for setuptools/pip distributions in.
                        This option can be used multiple times.
>
>**--download**            Download preinstalled packages from PyPI.
>
>**--no-download**, **--never-download**
                        Do not download preinstalled packages from PyPI.
>
>**--prompt**=*PROMPT*       Provides an alternative prompt prefix for this
                        environment.
>
>**--setuptools**          DEPRECATED. Retained only for backward compatibility.
                        This option has no effect.
>
>**--distribute**          DEPRECATED. Retained only for backward compatibility.
                        This option has no effect.


