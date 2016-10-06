" Writes numbers 1 to 10 (loops start at 1 by default)
let @i=1-1
while @i<10
let @i=@i+1
let @a = nr2char(@i+96)
execute "normal i".@a.": \<esc>".@i."a=\<esc>a\<cr>"
endwhile
