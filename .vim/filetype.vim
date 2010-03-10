if exists("did_load_filetypes")
    finish
endif

augroup markdown
    au! BufRead,BufNewFile *.{text,markdown,mkd,mkdn,mdown} setfiletype markdown
augroup END

augroup textile
    au! BufRead,BufNewFile *.textile setfiletype textile
augroup END

augroup tumblr
    au! BufRead,BufNewFile *.tumblr.html setfiletype tumblr
augroup END
