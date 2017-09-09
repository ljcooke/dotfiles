highlight! link NonText Comment

set lines=48 columns=140
set colorcolumn=+1
set guioptions=aeimr
set mousehide

if has('gui_macvim')
  set guifont=SourceCodePro-Regular:h11,Menlo-Regular:h11
  autocmd VimLeave * :!open -a Terminal
"elseif has('gui_gtk2')
"elseif has('gui_win32')
end
