run:
	@node_modules/.bin/coffee -c -o . src

test: run
	@node_modules/.bin/nodeunit test
