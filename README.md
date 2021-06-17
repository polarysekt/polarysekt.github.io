README
======

# Getting Started

NOTE: Having an updated ruby system-wide will help quite a bit.

## Clone

Clone yourself a local copy of the repository:


### HTTPS


```sh
$ git clone https://[user]@github.com/polarysekt/polarysekt.github.io
```

where [user] is your GitHub username.

NOTE: For preview-only, repository can be cloned without a username.


### SSH

todo


## Local Live Preview

To preview the BLOG locally, you will need a few prerequisites:

### Ruby

You will want an updated version of ruby installed system-wide. Older 2.x versions have been known to bork.

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
$ make install
```

If you run into difficulties, such as a particular package not being found, try:

```sh
$ rm Gemfile.lock
```

then clean:

```sh

$ make clean

```

and retry:

```sh
$ make _get_gems
```


Now you should be able to run the server.


### Local LiveReload Server (default)

```
$ make serve
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

FIX: force install jekyll

```sh
make install _get_jekyll
```

## ruby version out of date

Older ruby versions may fail to install some gems (i.e. ruby 2.5)

```
An error occurred while installing http_parser.rb (0.6.0), and Bundler cannot continue.
Make sure that `gem install http_parser.rb -v '0.6.0' --source 'https://rubygems.org/'` succeeds before bundling.
```

FIX: update ruby system-wide

```sh
