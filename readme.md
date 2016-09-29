# Autovim (UNDER DEVELOPMENT)

Autovim is simply [Vimscript](http://vim.org) optimized for processing files using the command line. It also has with shortcuts to make it better suited for [code golfing](http://ppcg.stackexchange.com). It is directly inspired by [V](https://github.com/DrMcMayhem/V), but aims at also being useful for day to day use.

## Why

* It is less verbose for some commands. A good example is `exe "norm ".i."x"` which can be expressed `ñ ¡ix`
* It can be used as a simple command line tool, e.g. `autovim -o -r "12i=\e"` will output 12 `=` to stdout
* It allows compressing commands, like `yy` can be expressed as `ý` (and offer the tools to compress/uncompress the code)
* It uses very magic and global regex by default
* It has no other dependencies than vim (none!)

## Usage

`autovim -f file.ext -r "script"` will run the specified script on file.ext.
`autovim -o -i` will run the script passed in stdin, and write the output to stdout.
`autovim -f file.ext -s script.autovim -a="arg1"` will run the script in `script.autovim`, and write the output to stdout while setting the global variable arg1.
* `-d` can be used to leave vim opened and see every step

## Syntax

Any Vimscript code will work as is; Autovim will simply expand variables. Therefore, this:

    if (a > 3)
      echom "hello world"
    endif

is the exact equivalent of

    í(¡a>3)echom"helloworld"ì

* Spaces before quotes are unnecessary
* `if() ... endif` can be expressed `í() ... ì`

## Shortcuts

* `dd` -> `ď`
* `yy` -> `ý`
* `yl` -> `ľ`
