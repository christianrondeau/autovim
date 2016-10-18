# Autovim (UNDER DEVELOPMENT)

Autovim is simply [Vimscript](http://vim.org) optimized for processing files using the command line. It also has special syntax additions, built-in mappings and updated defaults to make it better suited for [code golfing](http://codegolf.stackexchange.com). It is directly inspired by [V](https://github.com/DJMcMayhem/V).

## Installation

Autovim currently works on Linux and Windows using Git Bash (not in PowerShell or cmd.exe). You also need to have VIM installed and available in your `PATH`. It is tested against VIM `7.4.1721` and `8.0`.

Since this is still under development, installation is done manually; simply checkout this repo, run `chmod +x ./bin/autovim` and you're good to go!

## Usage

`autovim run script.autovim` will run the specified script on whatever is provided to stdin, and write the output to stdout.

See [Autovim Documentation](doc/index.md) for more information.

## Why

* It is less verbose for normal commands that require variables. A good example is `execute "normal qqqqqyy".@x."pj@qq@q"`, which can be expressed `qñÿ®xpj`
* It can be used as a simple command line tool. The command `autovim run myscript.autovim` will output the script result to stdout (or to a file if you specify `--out`)
* It allows compressing commands, e.g. `yy` can be expressed as `ÿ` (and also offers tools to compress/uncompress any Vimscript file)
* It can receive input parameters from the command line, e.g. `autovim run myscript.autovim -@n "John Doe"`
* It uses `nocompatible` and very magic / global regex by default
* It has no dependencies other than Vim itself

## Syntax

Any Vimscript script file will work as is; Autovim will simply expand compressed expressions. Therefore, this:

    ñÿ®xp

is the exact equivalent of

    execute "normal! yy" . @x . "p"

See [Autovim Documentation](doc/index.md) for more syntax examples.

## Contributing

This project is mostly for learning purposes, but if you think you can use it yourself and feel like contributing, please do so. The only requirements is that tests still pass, the coding style is similar to the rest and new functionality has been discussed with me first.

To run tests, simply run `chmod +x ./tests/test` and run the script.

## How does it work?

Three things are happening:

1. `./bin/autovim` takes the command line inputs and forward them to vim by setting a `g:autovim_cmd` variable using `--cmd`
2. `./src/vimrc` is used to provide the runtime environment common to the scripts and autovim itself - it also defines mappings like `ÿ`
3. `./src/autovim.vim` then parses the input, loads the script, do some regex replacements on it, and finally runs (source) the result on the input file

## Fun facts

All of Autovim and its documentation was written on an Android phone (Samsung S7 Edge) thanks to the awesome [Termux](https://termux.com).

## Resources

* [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com) for a great introduction to Vimscript
* [Prpgramming Puzzles and Code Golf](http://codegolf.stackexchange.com) for crazy examples of efficient Vim (and other languages) usage
* And remember Vim's built-in help: `:help` and `:helpgrep`
