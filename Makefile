run:
	@npm install coffee-script
	@node_modules/.bin/coffee -o . -c src/
	@npm uninstall coffee-script

test: run
	@npm install nodeunit
	@node_modules/.bin/nodeunit test
	@npm uninstall nodeunit
