" markdown filetype
if exists("did\_load\_filetypes")
    finish
endif

augroup markdown
    au! BufRead,BufNewFile *.markdown setfiletype markdown
augroup END
