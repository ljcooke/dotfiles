" Vim syntax file
" Language: QIF
" Maintainer: Liam Cooke
" URL: https://github.com/ljcooke/vim-qif
" License: MIT

if exists("b:current_syntax")
  finish
endif

" Record data lines
syntax match qifRecord /^.*/
syntax match qifCode /^./ contained containedin=qifRecord

" Record delimiter line
syntax match qifDelimiter /^\^$/

" \%^ matches the start of the file
syntax match qifFirstLine /\%^.*/
syntax match qifFirstLinePrefix /^!Type:/ contained containedin=qifFirstLine nextgroup=qifFirstLineType
syntax match qifFirstLineType /.*/ contained

"highlight link qifRecord String
highlight link qifCode Keyword
highlight link qifDelimiter Delimiter
highlight link qifFirstLine Error
highlight link qifFirstLinePrefix PreProc
highlight link qifFirstLineType Constant

let b:current_syntax = "qif"
