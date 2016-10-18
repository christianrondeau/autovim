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
nnoremap ŷ vy
nnoremap ý lvy
nnoremap đ dd
nnoremap ѷ gv
nnoremap ğ gg
inoremap → <right>
inoremap ← <left>
inoremap ↓ <down>
inoremap ↑ <up>
inoremap ↚ <backspace>
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

function! Grd(w,h,c)
	let l:x = a:w
	let l:y = a:h
	while l:y > 0
		if l:x > 0
			execute "normal ".l:x."a".a:c
		endif
		normal o
		let l:y = l:y - 1
	endwhile
	execute "normal dd".a:h."k"
endfunction
" }}}
