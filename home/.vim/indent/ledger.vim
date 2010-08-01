" File Name: ledger.vim (indent file)
" Maintainer: Allan Neal
" Original Date: 04/12/04 10:55:20 
" Last Update: 04/12/04 10:55:12 
" Description: Indent the ledger file the in compliance with the ledger syntax
" highlighting file.  Entry is flush left and all accounts are indented one ts

" Only load of no other is loaded
if exists("b:did_indent")
	finish
endif
let b:did_indent = 1

setlocal indentexpr=LedgerIndent()

" Only define the funtion once
if exists("*LedgerIndent")
	finish
endif


function LedgerIndent()
	let lnum = prevnonblank(v:lnum - 1)
	let ind = 0
	if lnum == 0
		return 0
	endif
	if indent(lnum) != 0 && getline(v:lnum - 1) !~ '^$'
		return -1
	endif
	if getline(lnum) =~ '^\d\{1,2}\/\d\{1,2}' || getline(lnum) =~ '^\d{4}\/\d\{1,2}\/\d\{1,2}'
		let ind = ind + &sw
	endif
	return ind
endfunction

" vim:sw=4
