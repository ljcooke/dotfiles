if did_filetype()
  finish
endif

" Add rules to detect file types by inspecting the contents of the file.
" [Help: new-filetype (see option D), :filetype]
"if getline(1) =~ '^#!.*\<mine\>'
"  setfiletype mine
"elseif getline(1) =~? '\<drawing\>'
"  setfiletype drawing
"endif
