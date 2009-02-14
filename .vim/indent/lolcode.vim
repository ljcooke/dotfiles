" Vim indent file
" Language: Lolcode
" Author:   Runa Sandvik <runa@samfundet.no>
" URL:      http://home.samfundet.no/~runa/vim/indent/lolcode.vim
" Last Change: 2007 June 19

if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=GetLolIndent()
setlocal indentkeys+=0IM\sOUTTA\sYR
setlocal indentkeys+=o="IM IN YR"
setlocal nosmartindent

if exists("*GetLolIndent")
	finish
endif

function GetLolIndent()
   let lnum = prevnonblank(v:lnum - 1)
	if lnum == 0
	   return 0
	endif
	
	let ind = indent(lnum)

	if getline(v:lnum - 1) =~ '^\s*IM IN YR'
		let ind = ind + &sw
	endif
	if getline(v:lnum) =~ '^\s*IM OUTTA YR'
		let ind = ind - &sw
	endif
	if getline(v:lnum) =~ '^\s*}'
		let ind = ind - &sw
	endif
	
	return ind
endfunction
