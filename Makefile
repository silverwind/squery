
test:
	node_modules/.bin/eslint --color --quiet --ignore-pattern *.min.js .

min:
	node_modules/.bin/uglifyjs squery.js -o squery.min.js --mangle --compress --unsafe --comments '/squery/' && wc -c squery.min.js
	cat README.md | sed -E "s/([0-9]+) bytes/$$(node_modules/.bin/gzip-size --raw squery.min.js) bytes/g" > README.md
	git add squery.min.js
	git commit -m "rebuild"

update:
	node_modules/.bin/updates -u
	rm -rf node_modules
	yarn

publish:
	npm publish
	git push --follow-tags

patch:
	$(MAKE) test
	$(MAKE) min
	npm version patch
	$(MAKE) publish

minor:
	$(MAKE) test
	$(MAKE) min
	npm version minor
	$(MAKE) publish

major:
	$(MAKE) test
	$(MAKE) min
	npm version major
	$(MAKE) publish

.PHONY: test min update publish patch minor major
