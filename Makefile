test:
	./bin/autovim compress ./tests/scripts/noop.autovim -of ./tests/output/noop.compressed.vim
	cmp ./tests/expected/noop.vim ./tests/output/noop.compressed.vim && echo 'pass' || echo 'fail'
