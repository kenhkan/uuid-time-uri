run:
	@node_modules/.bin/coffee -o . -c src/

test: run
	@node_modules/.bin/nodeunit test
