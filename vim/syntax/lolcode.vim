" Vim syntax file
" Language:     Lolcode
" Filenames:    *.lol
" Maintainer:   Runa Sandvik  <runa@samfundet.no>
" URL:          http://home.samfundet.no/~runa/lolcode.vim
" Last Change:  2007 June 17
"               2007 June 16 - initial version

" TODO: indent for loops :)
" Take a look at: /usr/share/vim/vim71/indent/perl.vim
" vim new-filetype: http://www.vim.org/htmldoc/filetype.html#new-filetype
" $HOME/.vim/syntax && $HOME/.vim/indent

" Statements
syn keyword lolStatement	VISIBLE HAI KTHX KTHXBYE
syn keyword lolStatement   GIMMEH PLZ ON INVISIBLE

syn match lolStatement   "OPEN FILE" 
syn match lolStatement	 "I HAS A"
syn match lolStatement   "AWSUM THX"
syn match lolStatement   "O NOES" 
syn match lolStatement	 "CAN HAS"

" Conditionals
syn keyword lolConditional IZ YARLY NOWAI
syn keyword lolConditional NOT AND OR XOR

syn match lolConditional "BIGGER THAN"
syn match lolConditional "?"

" Repeat
syn match lolRepeat	"IM IN YR" 
syn match lolRepeat	"IM OUTTA YR"

" Operators
syn keyword lolOperator AND OR NOT UP
syn match lolOperator "!!"

" Strings
syn match lolString "\"[^\"]*\""
syn match lolString "\'[^\']*\'"

" Comments
syn match lolComment "BTW.*"

" Yay, highlight
if version >= 508 || !exists("did_lol_syntax_inits")
   if version < 508
	let did_lol_syntax_inits = 1
	command -nargs=+ HiLink hi link <args>
  else
	command -nargs=+ HiLink hi def link <args>
  endif

" The default highlighting
HiLink lolStatement	Statement
HiLink lolConditional	Conditional
HiLink lolRepeat	Repeat
HiLink lolOperator	Operator
HiLink lolComment	Comment
HiLink lolString	String
   
	delcommand HiLink
 endif
 
let b:current_syntax = "lolcode"
