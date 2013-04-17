run:
	# Setup directory structure
	@cp -r src/* .
	# Compile
	@node_modules/coffee-script/bin/coffee -c .

test: run
	# Testing begins
	@node_modules/.bin/nodeunit test

clean:
	# Removing build files
	@rm -rf lib
	@rm -rf node_modules
	# Remove unnecessary files
	@find src -name *.js | xargs rm
	@find test -name *.js | xargs rm
