# Autovim Documentation

## Command Line

### Commands

* `autovim run script.autovim`: Expands and execute the provided script
* `autovim expand script.autovim`: Expands the provided script to a vim file (still requires autovim's vimrc)
* `autovim compress script.vim`: Compresses the provided script

### Parameters

* `-o --out`: By default, outputs to stdout. Specify `-out file.txt` to write to a file instead.
* `-d --debug`: Opens vim messages when done instead of exiting

## Autovim normal commands

These commands require autovim command line to run.

* `ñ...`: `exe "normal! ..."`

### Custom mappings

These commands require Autovim's `vimrc`, but can be run directly in Vim.

* `ÿ`: `yy`
