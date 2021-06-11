README
======

# Getting Started

This project can be interfaced with the simple `Makefile` located in the project root.

For a list of targets:

``` sh
$ make
```
or 

``` sh
$ make all
```

## Clone (git)

This is a public repository, so any user is free to clone a copy or fork.

For maintainers/developers -- please contact `polarysekt` on GitHub to get access to a branch.

Clone yourself a local copy of the repository:

### HTTPS

``` sh
$ git clone https://[user]@github.com/polarysekt/polarysekt.github.io
```

Where `[user]` is your GitHub username.

NOTE: |
------|
You may omit this for `Read-Only` clones, or configure it later in `.git/config`. |


### SSH

Make sure your public key is properly registered with the repository.


## Local Live Preview

To preview the BLOG locally, you will need a few prerequisites:

### ruby

NOTE:   |
--------|
Workflow *should* still work on 2.x, but will be dropped in favor of 3.x soon! |

You want the `gem` cli -- as the next steps will depend on this.

##### Debian

``` sh
# apt install ruby-full
```

##### Gentoo

``` sh
# emerge ruby-gems
```

### bundler

``` sh
# gem install bundler
```

NOTE:   |
--------| 
Using the makefile to install sytemwide dependencies is *NOT* best practice! |
Running any script or makefile as root (or via `sudo`) may cause *HARM*! |
You have been warned! |


### Install required gems

``` sh
$ make _get_gems
```

you can also try

``` sh
$ make _reget_gems
```

### Local Preview Server

Now you should be able to run the server.

``` sh
$ make _serve_simple
```

### Local LiveReload Server

``` sh
$ make _serve_livereload
```


## Using VSCODE (or VSCODIUM)

The `.vscode/tasks.json` includes scripts for running the server.

* serve local livereload

* serve local livereload drafts

# Troubleshooting

## package(s) not found

There may be versioned dependencies that have gone out of sync with installed ruby version.

Remove the lockfile:

```sh
$ rm Gemfile.lock
```

and retry:

```sh
$ make _get_gems
```

(underlying command

## jekyll not found

If you get an error such as `jekyll not found` when trying to run server:

``` plaintext
bundler: command not found: jekyll
Install missing gem executables with `bundle install`
make: *** [Makefile:44: _serve_livereload] Error 127
```

Get jekyll and set the folder for vendor files:

``` sh
$ make _get_jekyll
```
NOTE:   |
`.bundle/config` contains the path to the folder for gemfiles. |
