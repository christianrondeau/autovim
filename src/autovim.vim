" Autovim processing script

let s:debug=0
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

	if(!filereadable(s:scriptfile))
		throw "Script '".s:scriptfile."' is unreadable or does not exist"
	endif

	echom "Autovim: ".s:command

	let i = 2
	while i < len(g:autovim_cmd)
		if g:autovim_cmd[i] ==# "-o" || g:autovim_cmd[i] ==# "--out"
			let i += 1
			let s:outputfile=g:autovim_cmd[i]
		elseif g:autovim_cmd[i] ==# "-d" || g:autovim_cmd[i] ==# "--debug"
			let s:debug=1
		endif
		let i += 1
	endwhile
	" }}}

	" Open script {{{
	echom "Opening ".s:scriptfile
	execute "noswap edit ".s:scriptfile
	" }}}

	" Script processing {{{
	if s:command ==# "compress"
		" Compressing {{{
		throw "compression not implemented"
		" }}}
	elseif s:command ==# "expand" || s:command ==# "run"
		" Expanding' {{{
		%sm/ÿ/yy/e
		"g/^ñ/s/Q([^Q])Q/qqqqq\1@qq@q/g
		%sm/^ñ\(.\+$\)/execute "normal! \1"/e
		" }}}
	else
		throw "Invalid Autovim command: ".g:autovim_cmd
	endif
	" }}}

	" Runing {{{
	if s:command ==# "run"
		throw "running not implemented"
	endif
	" }}}

	" Write Output {{{
	if strlen(s:outputfile)
		echom "Writing output to ".s:outputfile
		execute "write! ".s:outputfile
	else
		echom "Writing to stdout"
		write !tee
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
		q!
	endif
	" }}}

endtry
