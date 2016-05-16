
lint:
	eslint --color --quiet --ignore-pattern *.min.js .

min:
	uglifyjs squery.js -o squery.min.js --mangle --compress --screw-ie8 --unsafe --comments '/squery/' && wc -c squery.min.js
	cat README.md | sed -E "s/([0-9]+) bytes/$$(gzip-size squery.min.js) bytes/g" > README.md

publish:
	npm publish
	git push --follow-tags

patch:
	$(MAKE) lint
	$(MAKE) min
	npm version patch
	$(MAKE) publish

minor:
	$(MAKE) lint
	$(MAKE) min
	npm version minor
	$(MAKE) publish

major:
	$(MAKE) lint
	$(MAKE) min
	npm version major
	$(MAKE) publish

.PHONY: lint min publish patch minor major
