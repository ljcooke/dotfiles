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

  au! BufRead,BufNewFile {.,}Brewfile setfiletype ruby
  au! BufRead,BufNewFile {pip-,}requirements.txt setfiletype conf
augroup END

" Use a template when creating a new file.
" [Help: skeleton]
augroup Templates
  au BufNewFile *.html 0r ~/.vim/templates/skeleton.html | $d
  au BufNewFile *.py   0r ~/.vim/templates/skeleton.py
  au BufNewFile *.sh   0r ~/.vim/templates/skeleton.sh
augroup END
