if exists("did_load_filetypes")
    finish
endif

runtime! ftdetect/*.vim

au! BufRead,BufNewFile *.{text,markdown,mkd,mkdn,mdown,ronn} setfiletype markdown

au! BufRead,BufNewFile *.ck setfiletype ck
au! BufRead,BufNewFile *.fql setfiletype sql
au! BufRead,BufNewFile *.{ldg,ledger} setfiletype ledger
au! BufRead,BufNewFile *.textile setfiletype textile

au! BufRead,BufNewFile *.mako.html setfiletype mako
au! BufRead,BufNewFile *.tumblr.html setfiletype tumblr
