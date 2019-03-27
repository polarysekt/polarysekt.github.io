#!/usr/bin/env bash

.PHONY: all

all:
	echo "USAGE:\t$@ COMMAND\n\n\t\t_get_jekyll\n\n\t\t_get_gems\n\n\t\t_get_all\n\n\t\t_clean\n\n\t\t_serve_simple\n\n\t\t_serve_livereload\n\n"


_get_jekyll:
	@echo "INIT bundler..."
	bundle init
	@echo "SPECIFY a local path to isolate environment"
	@echo "  bundle will remember this environment for this folder"
	bundle install --path vendor/bundle/

	@echo "GET jekyll gem"
	bundle add jekyll --path vendor/bundle/

__create_new:
	bundle exec jekyll new --force --skip-bundle .	
	
_get_gems:
	@echo "CREATE a new boilerplate project..."
	bundle install --full-index
	
_serve_simple:
	@echo "SERVE an instance of the server..."
	bundle exec jekyll serve
	
_serve_livereload:
	@echo "SERVE a livereload instance of the server..."
	bundle exec jekyll serve --livereload
	
_serve_draft:
	@echo "SERVE a livereload instance of the server (including drafts)..."
	bundle exec jekyll serve --livereload --draft

_clean:
	@echo "CLEAN generated files..."
	bundle exec jekyll clean

_get_all: _get_jekyll _get_gems
	@echo "k."
