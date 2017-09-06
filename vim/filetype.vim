if exists("did_load_filetypes")
  finish
endif

" Add autocommands to detect file types based on the file name.
" [Help: new-filetype (see option C), :filetype]
augroup FileTypeDetect
  au! BufRead,BufNewFile *.fql setfiletype sql
  au! BufRead,BufNewFile *.{ldg,ledger} setfiletype ledger
  au! BufRead,BufNewFile *.less setfiletype css
  au! BufRead,BufNewFile *.m setfiletype objc
  au! BufRead,BufNewFile *.plist setfiletype xml
  au! BufRead,BufNewFile *.sbg setfiletype conf
augroup END
