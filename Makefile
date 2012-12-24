run:
	# Setup directory structure
	@cp -r src/* .
	# Compile
	@coffee -c .
	# Remove unnecessary files
	@find src -name *.js | xargs rm
	@find test -name *.js | xargs rm
	@find lib -name *.coffee | xargs rm

test: run
	# Testing begins
	@node_modules/.bin/nodeunit test
