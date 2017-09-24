" Vim filetype plugin
" Language: QIF
" Maintainer: Liam Cooke
" URL: https://github.com/ljcooke/vim-qif
" License: MIT

" Only do this when not done yet for this buffer
if (exists('b:did_ftplugin'))
  finish
endif
let b:did_ftplugin = 1

setlocal nomodeline
setlocal comments=


" -----------------------------------------------------------------------------
" Sections

function! s:NextSection(forward, count)
  let save = @/
  mark '

  if a:forward
    let flags = ''
  else
    let flags = 'b'
  endif

  let i = 0
  while i < a:count
    let i = i + 1
    let pos = search('^\^$', 'W' . flags)

    if pos == 0
      if a:forward == 0
        call cursor(1, 1)
      endif
      break
    endif
  endwhile

  call histdel('search', -1)
  let @/ = save
endfunction

noremap <script> <buffer> <silent> ]] :<C-U>call <SID>NextSection(1, v:count1)<cr>
noremap <script> <buffer> <silent> ][ :<C-U>call <SID>NextSection(1, v:count1)<cr>
noremap <script> <buffer> <silent> [[ :<C-U>call <SID>NextSection(0, v:count1)<cr>
noremap <script> <buffer> <silent> [] :<C-U>call <SID>NextSection(0, v:count1)<cr>
