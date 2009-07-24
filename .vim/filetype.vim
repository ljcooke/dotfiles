" markdown filetype
if exists("did\_load\_filetypes")
    finish
endif

augroup markdown
    au! BufRead,BufNewFile *.{markdown,mkd,mkdn,mdown} setfiletype markdown
augroup END
