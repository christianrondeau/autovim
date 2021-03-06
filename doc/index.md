# Autovim Documentation

See the [tutorial](tutorial.md) to understand the basics first.

## Command Line

### Commands

* `autovim run script.autovim`: Expands and execute the provided script
* `autovim expand script.autovim`: Expands the provided script to a vim file (still requires autovim's vimrc)
* `autovim compress script.vim`: Compresses the provided script

### Parameters

* `-o --out`: By default, outputs to stdout. Specify `-out file.txt` to write to a file instead.
* `-i --in`: The starting buffer file path.
* `-ni --no-in`: To skip reading from stdin
* `-d --debug`: Opens vim messages when done instead of exiting
* `-@<register> value`: Sets a register value, e.g. `-@a 5` will allow pasting in your script using `"ap` or repeating a command using `®a<command>`

## Autovim syntax

None of these functions are necessary to run a script with autovim. They can be useful to express commands in a more succint way (e.g. for [code golfing](https://codegolf.stackexchange.com)).

Note that all variables in *compressed* commands use *registers*. Keep this in mind when recording macros or yanking.

To make editing these scripts easier,you can `source` the [edit/autovimrc.vim](edit/autovimrc.vim) file and make use of the digraph mappings for special symbols.

### Script compressed commands

These commands allow executing *compressed* expressions; strings that are typically run in *normal* mode.

Expressions in `(...)` will be evaluated rather than sent as-is.

* `ñ...`: Runs the specified commands in _normal_ mode (`normal ...`)
* `qñ...`: Loops the specified commands (same as `qq...@qq@q`)
* `%ñ...`: Runs the specified commands in _normal_ mode on every line (`%normal ...`)
* `⁝...` p: Runs the specified cpmmand in _command_ mode (`execute "..."`9638)
* `®<register>=<expr>`: Assigns a string to the register - autovim aliases are parsed (e.g. `®a=®xi#␛`)

### Script uncompressed commands

Similar to compressed commands, but the expressions will not be uncompressed Only `ª` and built-in functions will be expanded.

* `@<register>=<expr>`: Executes an expression and assigns the result to a register (e.g. `@a=@x+1`)
* `@+=<expr>`, `@-=<expr>`: Increments/decrements by the expression
* `@++`, `@--`: Increments/decrements by one

### Functions

You can declare Vimscript functions using `ƒ<name>` (limited to one character), which will bootstrap the definition (with `...` parameters) as well as a repeatable normal mapping `ƒ<name>`. Functions can define an arbitrary amount of lines, and end with `eƒ`.

    ƒT
    ñI*
    eƒ

The resulting Vimscript will be similar to:

    function! H(...)
      normal I*
    endfunction

You can reference function arguments inside compressed commands using `ª<index>` (`ª1` translates to `a:1`):

    @a=ª1+ª2

You can also return a value using `↶`(note that this is a compressed command, but Vim will allow arithmetics on the resulting strings):

    ↶ª1+ª2

A function can be called and its result assigned to a register too:

    @x=T(2+3)

It is possible to declare single line functions:

    ƒHñiHello World!␍

Finally, a function can be executed and even repeated in normal mode:

    ñ3ƒH

### Loops

Loops are in fact a `while` that increments a register up to an upper bound. The syntax is `↻<register><lower-bound-expr>:<upper-bound-expr>`, ended by `e↻`. The lower bound is optional (you can omit `<lower-bound-expr:`), it will start by 1 by default.

    ↻i1:10
    ño®i
    e↻

It is also possible to loop in a list (for each). The syntax is `…<register><list-expr>`, ended by `e…`.:

    …isplit(@a)
    ño®i
    e…

When only a register is provided, it is automatically split: `…<register>@<register-to-split>`, ended by `e…`.:

    …i@a
    ño®i
    e…

### Utilities inside compressed commands

These special commands can be used inside lines like `ñ`.

* `®<register>`: Injects the value of the given register. If `@a` equals `5`, then `ñ®ap` will execute `5p` in _normal_ mode.
* `␛`: Sends `<esc>`
* `␍`: Sends `<cr>`
* `█`: Sends `<ctrl>` + `v` (block mode)
* `⌥<key>`: Sends `<ctrl> + <key>`

### Custom mappings

These commands require Autovim's `vimrc`, and are run directly by Vim.

* `ÿ`: `yy` yanks current line
* `ỳ`: `yh` yanks previous character
* `ŷ`: `yl` yanks current character
* `ý`: `lyl` yanks next character
* `đ`: `dd` deletes current line
* `ğ`: `gg` moves to the beginning of the file
* `ѷ`: `gv` recover previous visual selection
* `↚`: `<backspace>` deletes previous char in *insert* mode
* `←`: `<left>` moves left in *insert* mode
* `→`: `<right>` moves right in *insert* mode
* `↓`: `<down>` moves down in *insert* mode
* `↑`: `<up>` moves up in *insert* mode

## Built-in functions

* `Rnd(max)` (or `¿` in compressed commands) returns an integer between 1 and *max*.
* `Grd(width, height, char)` (or `▦<width-expr>,<height-expr>,<char-expr>` in compressed commands) draws a grid and returns the cursor to the first character (top-left)returns an integer between 1 and *max*.
