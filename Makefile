run:
	@rm -rf lib
	@mkdir lib
	@coffee -o lib -c src/lib/UriMaker

test: run
	@node_modules/.bin/nodeunit test
