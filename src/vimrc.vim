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

" Functions {{{
let s:rnd = localtime() % 0x10000
function! Rnd(...)
	let l:max = 2
	if a:0 > 0
		let l:max = a:1
	endif
	let s:rnd = (s:rnd * 31421 + 6927) % 0x10000
	return s:rnd % l:max + 1
endfunction
" }}}
