.PHONY: all

#	@echo -e "USAGE:\tmake [COMMAND]\n\n\tCOMMAND:\n\n\t\t_get_bundler\n\n\t\t_update_bundler\n\n\t\t_get_gems\n\n\t\t_clean\n\n\t\t_serve_simple\n\n\t\t_serve_livereload\n\n"


all:
	@echo -e "USAGE:\tmake [COMMAND]\n\n\tCOMMAND:\n\n\t\tinstall\tclean/install gems\n\n\tNOTE: \`bundler\`should be installed system-wide!\n"

install: _clean_vendor _get_gems _get_jekyll

serve: _serve_livereload

clean: _clean_vendor

_clean_vendor:
	@echo ">> CLEAN :: remove _vendor [jekyll|gems]"
	@rm -fr _vendor/

_init_vendor:
	@echo ">> INIT :: make/check _vendor folder"
	@mkdir -p _vendor/
	@echo ">> SET :: local path to \'_vendor\'"
	@bundle config set --local path '_vendor'

_get_gems: _init_vendor
	@echo ">> GET :: gems"
	@bundle install

_reget_gems: _init_vendor
	@echo ">> GET :: gems (full-index)"
	@bundle install --full-index

_get_jekyll: _init_vendor
	@echo ">> GET :: jekyll"
	@bundle add jekyll

_serve_livereload:
	@echo "SERVE a livereload instance of the server..."
	bundle exec jekyll serve --livereload

## some examples
#_get_bundler:
#	@echo "GET 'bundler' gem... (NOTE: may require system-wide)"
#	gem install bundler

#_update_bundler:
#	@echo "UPDATE 'bundler'..."
#	bundle update --bundler

#__init_bundler:
#	@echo "INIT bundler..."
#	bundle init

#__create_new:
#	bundle exec jekyll new --force --skip-bundle .

#_serve_simple:
#	@echo "SERVE an instance of the server..."
#	bundle exec jekyll serve

#_serve_draft:
#	@echo "SERVE a livereload instance of the server (including drafts)..."
#	bundle exec jekyll serve --livereload --draft
