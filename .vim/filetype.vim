if exists("did\_load\_filetypes")
    finish
endif

augroup markdown
    au! BufRead,BufNewFile *.{text,markdown,mkd,mkdn,mdown} setfiletype markdown
augroup END
