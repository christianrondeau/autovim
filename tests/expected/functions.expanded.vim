" Single line function
nmap ƒH @=':call H()<c-v><cr>'<cr>
function! H(...)
execute "normal iHello\<cr>"
endfunction

" Calls H 3 times
execute "normal 3ƒH"

" Multi line function
nmap ƒT @=':call T()<c-v><cr>'<cr>
function! T(...)
execute "normal iValue: \"".a:1."\"\<cr>"
let @a = a:1+2
return ".a:1."+@a
endfunction

" Calls T with param
let @x = T(2+3)
execute "normal iValue: ".@x."\<cr>"
