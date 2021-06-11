README
======

# Getting Started


## Clone

Clone yourself a local copy of the repository:


### HTTPS


```sh
$ git clone https://[user]@github.com/polarysekt/polarysekt.github.io
```

where [user] is your GitHub username.


### SSH

todo

### GIT

todo

## Local Live Preview

To preview the BLOG locally, you will need a few prerequisites:

### Ruby Gems

#### Debian

```sh
# apt install ruby-full
```

#### Gentoo

```sh
# emerge ruby-gems
```

### bundle

```sh
# make _get_bundler
```

NOTE:   |
--------|
If you are uncomfortable running `sudo` prior to a `make` command, you can construct the command yourself: |
```sh |
# sudo gem install bundler |
``` |



You can update bundler:

```
$ make _update_bundler
```

### Install required gems

```sh
$ make _get_gems
```

If you run into difficulties, such as a particular package not being found, try:

```sh
$ rm Gemfile.lock
```

and retry

```sh
$ make _get_gems
```


Now you should be able to run the server.


### Local LiveReload Server

```
$ make _serve_livereload
```

## Using VSCODE

The `.vscode/tasks.json` includes scripts for running the server.

* serve local livereload

* serve local livereload drafts

# Troubleshooting

## jekyll not found

If you get an error such as `jekyll not found` when trying to run server:

```
bundler: command not found: jekyll
Install missing gem executables with `bundle install`
make: *** [Makefile:44: _serve_livereload] Error 127
```

