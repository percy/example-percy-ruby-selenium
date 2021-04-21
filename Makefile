NPM=node_modules/.bin
NPMDEPS=$(node_modules)
VENDOR=vendor/bundle/ruby

.PHONY: npm bundle install clean serve test


$(NPM): $(NPMDEPS)
	npm install

$(VENDOR):
	bundle install

bundle: $(VENDOR)

npm: $(NPM)

install: npm bundle

clean:
	rm -rf $$(cat .gitignore)

serve:
	ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'

test: install
	$(NPM)/percy exec -- ruby tests/todo.rb
