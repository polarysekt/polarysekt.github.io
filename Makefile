.PHONY: all

all:
	@echo -e "USAGE:\tmake [COMMAND]\n\n\tCOMMAND:\n\n\t\t_get_bundler\n\n\t\t_update_bundler\n\n\t\t_get_gems\n\n\t\t_clean\n\n\t\t_serve_simple\n\n\t\t_serve_livereload\n\n"


_get_bundler:
	@echo "GET 'bundler' gem..."
	gem install bundler

_update_bundler:
	@echo "UPDATE 'bundler'..."
	bundle update --bundler

__init_bundler:
	@echo "INIT bundler..."
	bundle init

_get_gems:
	@echo "SPECIFYING a local path to isolate ruby environment..."
	@echo "USING: 'vendor/bundle'"
	@echo "  bundle will remember this environment for this folder."
	bundle install --path vendor/bundle/

_get_jekyll:
	@echo "GET 'jekyll' gem"
	bundle add jekyll --path vendor/bundle/

__create_new:
	bundle exec jekyll new --force --skip-bundle .	

_reget_gems:
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

_get_all: _get_gems
	@echo "k."
