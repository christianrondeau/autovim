" Autovim files editing config
" You can add `source .../autovim/edit/vimrc` ti your own vimrc if you want

set nocompatible
scriptencoding utf-8
set encoding=utf-8

autocmd BufNewFile *.autovim set filetype=vim

augroup filetype_autovim
  autocmd!
  autocmd FileType vim setlocal noautoindent nocindent nosmartindent
augroup END

" Commands
dig no 241  " ñ normal
dig rg 174  " ® register
dig es 9243 " ␛ escape
dig cr 9229 " ␍ cr (enter)
dig fu 402  " ƒ function
dig ar 170  " ª argument
dig re 8630 " ↶ return
dig fo 8635 " ↻ for
dig fe 8230 " … foreach
dig ct 8997 " ⌥ ctrl
dig gr 9638 " ▦ grid
dig ex 8285 " ⁝ execute

" Mappings
dig yy 255   " ÿ
dig yh 7923  " ỳ
dig yl 375   " ŷ
dig ly 253   " ý
dig dd 273   " đ
dig gg 287   " ğ
dig gv 1143  " ѷ
dig cv 1142  " Ѷ
dig bs 8602  " ↚

