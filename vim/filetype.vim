if exists("did_load_filetypes")
    finish
endif

runtime! ftdetect/*.vim

augroup FileTypeDetect
    au! BufRead,BufNewFile *.ck setfiletype ck
    au! BufRead,BufNewFile *.fql setfiletype sql
    au! BufRead,BufNewFile *.{ldg,ledger} setfiletype ledger
    au! BufRead,BufNewFile *.less setfiletype css
    au! BufRead,BufNewFile *.m setfiletype objc
    au! BufRead,BufNewFile *.plist setfiletype xml
    au! BufRead,BufNewFile *.sbg setfiletype conf
augroup END
