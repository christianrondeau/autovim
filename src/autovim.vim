" Autovim processing script

let s:debug=0
let s:inputfile=""
let s:outputfile=""

try

	" Parse parameters {{{
	if !exists("g:autovim_cmd")
		throw "Autovim command not defined. Autovim must be launched using the executable in ./bin."
	endif

	let s:command=g:autovim_cmd[0]
	let s:scriptfile=g:autovim_cmd[1]

	if(!strlen(s:command))
		throw "A command is required. See ./doc for more information."
	endif

	echom "Autovim: " . s:command

	let s:i = 2
	while s:i < len(g:autovim_cmd)
		let s:p = g:autovim_cmd[s:i]
		if s:p ==# "-i" || s:p ==# "--in"
			let s:i += 1
			let s:inputfile=g:autovim_cmd[s:i]
		elseif s:p ==# "-o" || s:p ==# "--out"
			let s:i += 1
			let s:outputfile=g:autovim_cmd[s:i]
		elseif s:p ==# "-d" || s:p ==# "--debug"
			let s:debug=1
		elseif s:p =~# '^-@'
			let s:pname = s:p[2]
			let s:i += 1
			let s:pvalue=g:autovim_cmd[s:i]
			let s:pvalue = substitute(s:pvalue, '\\', '\\\\', "ge")
			let s:pvalue = substitute(s:pvalue, '"', '\\"', "ge")
			execute "let @" . s:pname . " = \"" . s:pvalue . "\""
		endif
		let s:i += 1
	endwhile

	if !strlen(s:outputfile)
		if !exists("g:autovim_tmp")
			throw "Autovim temp file not defined."
		endif
		let s:outputfile = g:autovim_tmp
	endif
	" }}}

	" Open script {{{
	if(!filereadable(s:scriptfile))
		throw "Script '".s:scriptfile."' is unreadable or does not exist"
	endif

	echom "Opening script ".s:scriptfile
	execute "noswap edit! ".s:scriptfile
	normal! gg
	" }}}

	if s:command ==# "compress"
		" Compressing {{{
		throw "compression not implemented"
		" }}}
	elseif s:command ==# "expand" || s:command ==# "run"
		" Expanding {{{
		function ExpandQuoted()

			" Escape quotes
			sm/\v"/\\"/e 

			" Registers (except string begin)
			sm/\v^@<!®(.)/".@\1."/e

			" Keys
			sm/\v␛/\\\<esc\>/e
			sm/\v␍/\\\<cr\>/e
			sm/\v⌥(.)/\\\<c-\1\>/e

			" Variables
			sm/\vª(.)/".a:\1."/e
			
		endfunction
		
		function ExpandUnquoted()

			" Variables
			sm/\vª(.)/a:\1/e

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
		silent g/\v^([q%]?ñ|®.\=|↶)/call ExpandQuoted()
		silent g/\v^(\@.\=)/call ExpandUnquoted()

		" Expands ®=
		%sm/\v^®(.)\=(.+$)/let @\1 = "\2"/e

		" Expands @=
		%sm/\v^\@(.)\=(.+$)/let @\1 = \2/e

		" Expands qñ
		%sm/\v^qñ(.+$)/let @q="\1@q"\rnormal @q"/e

		" Expands ñ
		%sm/\v^(\%)?ñ(.+$)/execute "\1normal \2"/e

		" Expands ↶
		%sm/\v^↶(.+)/return \1/e
		" }}}
	else
		" Invalid command {{{
		throw "Invalid Autovim command: ".g:autovim_cmd
		" }}}
	endif

	" Running {{{
	if s:command ==# "run"
		" Copy script
		%y 

		" Open input file / create buffer
		if len(s:inputfile) 
			if(!filereadable(s:inputfile))
				throw "Input file '".s:inputfile."' is unreadable or does not exist"
			endif

			echom "Opening ".s:inputfile
			execute "noswap edit! ".s:inputfile
			normal! gg
		else
			enew!
		endif

		" Run script
		@" 
	endif
	" }}}

	" Write Output {{{
	if strlen(s:outputfile)
		echom "Writing output to ".s:outputfile
		execute "write! ".s:outputfile
	else
		echom "No output file defined"
	endif
	" }}}

catch

	" Error {{{
	call input("Error: " . v:exception . "\nPress Enter to continue.")
	" }}}

finally

	" Close {{{
	if s:debug
		messages
	else
		quit!
	endif
	" }}}

endtry
