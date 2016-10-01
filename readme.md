# Autovim (UNDER DEVELOPMENT)

Autovim is simply [Vimscript](http://vim.org) optimized for processing files using the command line. It also has special syntax additions, built-in mappinga and better defaults to make it better suited for [code golfing](http://codegolf.stackexchange.com). It is directly inspired by [V](https://github.com/DJMcMayhem/V), but aims at also being useful for day to day use.

## Why

* It is less verbose for some commands. A good example is `exe "norm yy".i."p"` which can be expressed `ñÿ¡ip`
* It can be used as a simple command line tool, e.g. `autovim run myscript.autovim` will output the script result to stdout (or to a file)
* It allows compressing commands, e.g. `yy` can be expressed a s`ÿ` (and also offers tools to compress/uncompress any Vimscript file)
* It uses nocompatible, and very magic / global regex by default
* It has no other dependencies than Vim itself

## Usage

`autovim run script.autovim` will run the specified script on whatever is provided to stdin, and write the output to stdout.

See [Autovim Documentation](doc/index.md) for more examples.

## Syntax

Any Vimscript code will work as is; Autovim will simply expand compressed expressions. Therefore, this:

    ñÿp

is the exact equivalent of

    execute "normal! yyp"

See [Autovim Documentation](doc/index.md) for more syntax examples like `ñ` and mappings like `ÿ`.

## Resources

* [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com) for a great introduction to Vimscript
* [Prpgramming Puzzles and Code Golf](http://codegolf.stackexchange.com) for crazy examples of efficient Vim (and other languages) usage
* And remember Vim's built-in help: `:help` and `:helpgrep`
