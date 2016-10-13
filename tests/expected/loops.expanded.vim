" Writes numbers 1 to 10 (loops start at 1 by default)
let @i=1-1
while @i<10
let @i=@i+1
let @a = nr2char(@i+96)
execute "normal i".@a.": \<esc>".@i."a=\<esc>a\<cr>"
endwhile
execute "normal o"

" Writes numbers 2 to 7
let @i=2-1
while @i<3+4
let @i=@i+1
execute "normal a".@i.""
endwhile
execute "normal o"

" Prints all items in list
let a = [1,2,3]
for @i in a
execute "normal a".@i.""
endfor
execute "normal o"

" Prints split items on lines
let @l = "abc def ghi"
for @i in split(@l)
execute "normal o".@i.""
endfor
