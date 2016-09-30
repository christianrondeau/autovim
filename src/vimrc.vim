" Settings {{{
set nocompatible
filetype off
" }}}

" Regex {{{
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
cnoremap g/ g/\v
cnoremap g!/ g!/\v
set gdefault " Use /g by default
" }}}
