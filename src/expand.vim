" Autovim expanding script
scriptencoding utf-8

" Wrap parenthesis in non-quotes
let @p="f(i\".\e%a.\"\e@q"

function ExpandQuoted()

	" Escape quotes
	sm/\v"/\\"/e

	" Do not escape within ()
	norm @p

	" Registers (except string begin)
	sm/\v^@<!®(.)/".@\1."/e

	" Keys
	sm/\v␛/\\\<esc\>/e
	sm/\v␍/\\\<cr\>/e
	sm/\v⌥(.)/\\\<c-\1\>/e

	" Variables
	sm/\vª(.)/".a:\1."/e

	" Built-in functions
	sm/\v¿(\d*)/".Rnd(\1)."/e

endfunction

function ExpandUnquoted()

	" Variables
	sm/\vª(.)/a:\1/e

	" Built-in functions
	sm/\v¿(\d*)/Rnd(\1)/e

endfunction

" Expands single-line functions
%sm/\v^ƒ(.)(.+$)/nmap ƒ\1 @=':call \1()<c-v><cr>'<cr>\rfunction! \1(...)\r\2\rendfunction/e

" Expands multi-line functions
%sm/\v^ƒ(.)$/nmap ƒ\1 @=':call \1()<c-v><cr>'<cr>\rfunction! \1(...)/e
%sm/\v^eƒ$/endfunction/e

" Expands multi-line loops
%sm/\v^↻(.)([^:]+):(.+$)/let @\1=\2-1\rwhile @\1<\3\rlet @\1=@\1+1/e
%sm/\v^e↻$/endwhile/e

" Expands special autovim chars
silent g/\v^([q%]?ñ|®.\=|↶|⁝)/call ExpandQuoted()
silent g/\v^(\@.\=)/call ExpandUnquoted()

" Expands ®=
%sm/\v^®(.)\=(.+$)/let @\1 = "\2"/e

" Expands @=
%sm/\v^\@(.)\=(.+$)/let @\1 = \2/e

" Expands @++ @--
%sm/\v^\@(.)\+\+$/let @\1 = @\1 + 1/e
%sm/\v^\@(.)\-\-$/let @\1 = @\1 - 1/e

" Expands @+= @-=
%sm/\v^\@(.)\+\=(.+$)/let @\1 = @\1 + \2/e
%sm/\v^\@(.)\-\=(.+$)/let @\1 = @\1 - \2/e

" Expands qñ
%sm/\v^qñ(.+$)/let @q="\1@q"\rnormal @q"/e

" Expands ñ
%sm/\v^(\%)?ñ(.+$)/execute "\1normal \2"/e

" Expands ⁝
%sm/\v^⁝(.+$)/execute "\1"/e

" Expands ↶
%sm/\v^↶(.+)/return \1/e

" Built-in functions
%sm/\v▦(.+),(.+),(.*)$/call Grd(\1, \2, "\3")/e

" Reset expanding macros
let @p=""
