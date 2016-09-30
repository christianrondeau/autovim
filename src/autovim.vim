" Autovim processing script

echom "Autovim processing started"

if !exists("g:autovim_cmd")
	throw "Autovim command not defined"
endif

" TODO: Replace by input file
noswap edit ./tests/scripts/compressed-commands.autovim
" TODO: Replace by output file
" TODO: If debug flag not set, di not save and close

if g:autovim_cmd ==# "compress"
	throw "compression not implemented"
elseif g:autovim_cmd ==# "expand"
	%sm/ÿ/yy/e
	%sm/ñ\(.\+$\)/execute "normal! \1"/e
elseif g:autovim_cmd ==# "run"
	throw "running not implemented"
else
	throw "Invalid Autovim command: ".g:autovim_cmd
endif

saveas! ./tests/output/compressed-commands.expanded.vim
normal! ZZ
