test:
	rm -f ./tests/output/compressed-commands.expanded.vim
	./bin/autovim compress ./tests/scripts/compressed-commands.autovim -of ./tests/output/compressed-commands.expanded.vim
	cmp ./tests/expected/compressed-commands.expanded.vim ./tests/output/compressed-commands.expanded.vim && echo 'pass' || echo 'fail'
