# Autovim Documentation

## Command Line

### Commands

* `autovim run script.autovim`: Expands and execute the provided script
* `autovim expand script.autovim`: Expands the provided script to a vim file (still requires autovim's vimrc)
* `autovim compress script.vim`: Compresses the provided script

### Parameters

* `-o --out`: By default, outputs to stdout. Specify `-out file.txt` to write to a file instead.
* `-i --in`: The starting buffer file path.
* `-d --debug`: Opens vim messages when done instead of exiting
* `-@<register> value`: Sets a register value, e.g. `-@a 5` will allow pasting in your script using `"ap` or repeating a command using `®a<command>`

## Autovim script commands

These commands require autovim command line to run.

* `ñ...`: Runs the specified commands in _normal_ mode (`normal ...`)
* `qñ...`: Loops the specified commands (same as `qq...@qq@q`)
* `%ñ...`: Runs the specified commands in _normal_ mode on every line (`%normal ...`)
* `@<register>=<expr>`: Executes an expression and assigns the result to a register (e.g. `@a=@x+1`)
* `®<register>=<expr>`: Assigns a string to the register - autovim aliases are parsed (e.g. `®a=®xi#␛`)

### Utilities inside ñ

These special commands can be used inside a `ñ` line

* `®<register>`: Injects the value of the given register. If `@a` equals `5`, then `ñ®ap` will execute `5p`
* `␛`: Sends `<esc>`
* `␍`: Sends `<cr>`
* `⌥<key>`: Sends `<ctrl> + <key>`

### Custom mappings

These commands require Autovim's `vimrc`, and are run directly by Vim.

* `ÿ`: `yy` yanks current line
* `ỳ`: `yh` yanks previous character
* `ŷ`: `yl` yanks current character
* `ý`: `lyl` yanks next character
* `đ`: `dd` deletes current line
* `ѷ`: `gv` recover previous visual selection
