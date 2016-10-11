" Insert a random amount of +, and reset to +
let @r = Rnd(123)
execute "normal i12-\<esc>\<c-v>".Rnd(10)."hr+Vr+o"

" Draw a 0x1 (simple line break) grid and a 3x3 grid of #
let @r = 3
call Grd(@r, 2+1, "#")
