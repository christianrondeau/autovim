" Write register @a
execute "normal i@a: \e\"apo\e"

" Set registers
let @c = @b+1-1
let @d = "".@c.""

" Operations
let @d = @d + 1
let @d = @d + 5
let @d = @d - 2
let @d = @d - 1

" Use register @d value
execute "normal i@b: \"\e".@d."a*\ea\""

