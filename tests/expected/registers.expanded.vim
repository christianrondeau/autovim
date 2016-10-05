" Write register @a
execute "normal i@a: \e\"apo\e"

" Set registers
let @c = @b+1-1
let @d = "".@c.""

" Use register @d value
execute "normal i@b: \"\e".@d."a*\ea\""

