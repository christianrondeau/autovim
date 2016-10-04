" Empty file
execute "normal dG"

" Write register @a
execute "normal i@a: \e\"apo\e"

" Use register @b value
execute "normal i@b: \"\e".@b."a*\ea\""
