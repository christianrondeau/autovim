" Insert a random amount of =, and delete them all but one
let @r = Rnd(123)
execute "normal ".Rnd(10)."i=\<esc>0ld$o"

" Draw a 0x1 (simple line break) grid and a 3x3 grid of #
let @r = 3
call Grd(@r, 2+1, "#")
