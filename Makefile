all:

%_github.png:
	curl -sL https://github.com/$*.png -o $@

clean:
	@fd --no-ignore-vcs github.png --exec-batch rm -vf {} \;

.PHONY: all clean
