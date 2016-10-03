@echo off
echo WARNING: Autovim does not work on Windows yet!
setlocal enableDelayedExpansion
set BinPath=%~dp0
:loop
set ParamsArray=!ParamsArray!\"%~1\", 
shift
if not "%~1"=="" goto loop
set AutovimCmd=let g:autovim_cmd=[!ParamsArray!\"\"]
set ExecAutovimCmd=vim -u !BinPath!..\src\vimrc.vim -S !BinPath!..\src\autovim.vim --not-a-term --cmd "!AutovimCmd!"
call echo !ExecAutovimCmd!
call !ExecAutovimCmd!
endlocal
