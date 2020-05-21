GITHUB_CHECKOUT_DIR ?= ~/Git
SHELL := /bin/sh
PATH  := /usr/local/bin:$(PATH)
REPOS := $(shell $(CURDIR)/bin/list-github-repos $(GITHUB_CHECKOUT_DIR))
STAMP := $(shell echo $(REPOS) | md5 -q )

.PHONY: all clean

all: results.json $(patsubst %/,%.png,$(dir $(REPOS)))
	@cat results.json

results.json: $(STAMP).json results.jq
	@jq -f results.jq < $< > $@

$(STAMP).json: Makefile
	@$(CURDIR)/bin/jsonify-argv $(REPOS) > $@
	@find . -not -name results.json -not -name $@ -name '*.json' -print0 | xargs -0 rm

%.png:
	@curl -sL https://github.com/$@ -o $@

clean:
	@find . -not -name 21CA14F2-E0C1-4CF6-B2BC-48AEEF72357B.png -name '*.png' -print0 | xargs -0 rm
	@rm *.json
