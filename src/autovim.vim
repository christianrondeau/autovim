" Autovim processing script

echom "Autovim processing started"
" TODO: Replace by input file
noswap edit ./tests/scripts/noop.autovim
" TODO: Replace by output file
" TODO: If debug flag not set, di not save and close
saveas! ./tests/output/noop.compressed.vim
normal! ZZ
