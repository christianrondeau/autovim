" Settings {{{
set nocompatible
filetype off
set encoding=utf-8
scriptencoding utf-8
" }}}

" Runtime settings {{{
set visualbell t_vb=               " No screen flash (Android)
set noerrorbells                   " No error sounds
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

" Mappings {{{
nnoremap ÿ yy
nnoremap ỳ yh
nnoremap ŷ yl
nnoremap ý lyh
nnoremap đ dd
nnoremap ѷ gv
" }}}
