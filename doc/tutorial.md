# Autovim tutorial

Before anything, you have to understand Vimscript basics. The best resource for this is the excellent [Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com). Once this is done, or if you are feeling adventurous, you can begin this tutorial.

## Getting started

First of all, let's make sure Autovim works. See [README](../README.md); in short, clone this repo and install Vim (you might also want to update it to the latest version: new is always better!)

Now, let's create a new empty autovim file:

    $ touch helloworld.autovim

And try to run it:

    $ autovim run helloworld.autovim -ni

You should get... nothing! This is normal, our script does not do anything yet. Note the `-ni`; it means "no input", we'll get back to that later.

If you see an error message, check that Vim is installed, up to date and in your PATH, that autovim is in your PATH too or otherwose, specify the complete path to Autovim. If you're on Windows, try using Git Bash. Otherwise, create an [issue](https://github.com/christianrondeau/autovim/issues) and we'll figure it out.

Now let's do something in that script.

## It's just Vimscript!

Add this in our `helloworld.autovim` file:

    normal iHello World!

And run the script again:

    $ autovim run helloworld.autovim -ni

It says `Hello World!`, that was simple! We can also use variables and registers, like this:

    let @x = 3
    execute "normal " . @x . "iHello World!\<cr>"

*Note that we used a register when we could have used a simple variable; this is for the sake of the example.*

But if we are to do some code golfing, that's pretty verbose. This is where *compressed commands* become useful. Let's see that same example while taking advantage of Autovim's syntax:

    @x=3
    ñ®xiHello World!

We used three special constructs here. First, `@x=` is simply a shortened version of `let @x =`. Second, `ñ` is a *compressed command*; it expands to `execute "normal "..."`. Finally, `®x` is a *compressed command* syntax sugar for concatenating `@x` with the `ñ` string.

To see it for yourself, and debug your code later, you can simply see the expanded version:

    autovim expand helloworld.autovim

And you'll see the resulting Vimscript, expanded.

## Arguments

There are three ways to pass data to Autovim:

1. Use stdin as the starting buffer (the default if you do not pass `—ni`)
2. Pass a starting buffer file using `-in`
3. Pass command line parameters as *registers* using `-@<register>`

The first two should be self-explanatory, so let's look at the third.

Let's remove the register assignation from our script, so that it only contains this:

    ñ®xiHello World!

Now, let's run it again, but with the `x` register as an argument:

    $ autovim run helloworld.autovim -ni -@x 3

## Autovim mappings

_Compressed commands_ expand into normal Vimscript, but Autovim also comes with a built-in [vimrc](../src/vimrc.vim) that defines _mappings_, which are not expanded. Let's see all of this in practice.

Create a new `duplicate-lines.autovim` file:

    %ñÿp

And run it:

    autovim run duplicate-lines.autovim

Type some lines and press <kbd>Ctrl</kbd> + <kbd>d</kbd>. Magic! `%` means "on every line", and `ÿ` is a mapping for `yy`.

To make it easier to use these mappings and compressed commands, you can use digraphs by sourcing [edit/autovimrc.vim](../edit/autovimrc.vim):  `:source edit/autovimrc.vim` (if you are using Vim... you are, right?)

## What's next?

Now you know the basics, so you can jump right into the [documentation](index.md), and compete on [Programming Puzzles and Code Golf](http://codegolf.stackexchange.com)!
