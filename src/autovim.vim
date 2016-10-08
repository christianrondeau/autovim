" Autovim processing script
scriptencoding utf-8

let s:debug=0
let s:inputfile=""
let s:outputfile=""
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

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

	" Script processing {{{
	if s:command ==# "compress"
		throw "compression not implemented"
	elseif s:command ==# "expand" || s:command ==# "run"
		execute "source ".s:path."/expand.vim"
	else
		throw "Invalid Autovim command: ".g:autovim_cmd
	endif
	" }}}

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
