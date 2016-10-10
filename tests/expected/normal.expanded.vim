" Writes 'Match 1' and increments twice
execute "normal iLine 1\<cr>Match 1\<esc>2\<c-a>"

" Yank all and paste twice
execute "%y"
execute "normal ".(1+1)."p"
