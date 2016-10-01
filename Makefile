test:
	rm -f ./tests/output/compressed-commands.expanded.vim
	./bin/autovim expand ./tests/scripts/compressed-commands.autovim --out ./tests/output/compressed-commands.expanded.vim
	cmp ./tests/expected/compressed-commands.expanded.vim ./tests/output/compressed-commands.expanded.vim && echo 'pass' || echo 'fail'
