NPM=node_modules/.bin
VENDOR=vendor/bundle/ruby

.PHONY: install clean test test-advanced test-advanced-ci

$(NPM):
	npm install --no-save @percy/cli@^1.31.13

$(VENDOR):
	bundle config set path 'vendor/bundle'
	bundle install

install: $(NPM) $(VENDOR)

clean:
	rm -rf vendor node_modules advanced-requests.json .bundle

# Local run against a real PERCY_TOKEN.
test test-advanced: install
	$(NPM)/percy exec -- bundle exec rspec spec/

# CI run in --testing mode + capture requests file.
test-advanced-ci: install
	PERCY_TOKEN=fake_token $(NPM)/percy exec --testing -- bash -c '\
		bundle exec rspec spec/; \
		ec=$$?; \
		curl -fsS http://localhost:5338/test/requests > advanced-requests.json || true; \
		exit $$ec'
