set nocompatible
scriptencoding utf8

syntax on
if exists(':filetype')
    filetype plugin indent on
endif

if has('unix')
    let shell='bash'
endif


    "-----------------------------
    " General settings
    "-----------------------------

set ttyfast                 " using a fast connection
set cmdheight=2             " command line height
set number                  " line numbers
set ruler                   " show 'line,column' ruler
set nohlsearch              " don't highlight search results (enable with :hls)
set background=dark         " light on dark

set modeline                " read modelines (e.g. 'vim: set blah=blah :')
set showmatch               " highlight matching brackets when typing
set ignorecase smartcase    " ignorecase implied if search string is lowercase
set viminfo=""              " don't use a viminfo file
set nobackup writebackup    " temporary backup before writing
set textwidth=0 nojs        " text width (use gqap to wrap)
set ts=4 softtabstop=4      " spaces per tab
set shiftwidth=4 sta        " spaces per indentation
set ai si "cpo+=I           " autoindent + smartindent
set shiftround              " round indent to a multiple of shiftwidth
set bs=eol,start,indent     " allow backspacing over everything
set scrolloff=2             " a few lines of offset when scrolling
set mouse=a                 " allow mouse in all modes
set shm=flmnrxoOstTI        " make some messages less verbose
set noshortname             " don't use dos-style filenames

set expandtab               " <Tab> inserts spaces (insert a tab with ^V<Tab>)
set list                    " show tab characters and trailing whitespace

" OSX weirdness
set backupskip="/tmp/*,/private/tmp/*"

if &encoding == 'utf-8'
    set listchars=tab:·\ ,trail:.
else
    set listchars=tab:>\ ,trail:.
endif

if has('gui_running')
    set lines=36 columns=90
    set go=aeimrL
    set mousehide

    set guifont=DejaVu\ Sans\ Mono\ 11,Terminal
    "set t_Co=256
    colors desert
else
    colors elflord
endif


    "-----------------------------
    " Key bindings
    "-----------------------------

set pastetoggle=<F4>
nnoremap <Space> :
nnoremap <F1> :help<Space>
nnoremap <C-s> :w<CR>

" select all
nnoremap <F5> ggVG

" quick regex
nnoremap <C-Space> :s///<Left><Left>

" switching/closing buffers
nnoremap <Tab> <C-w><C-w>
nnoremap <C-F4> :bn<CR>:bd #<CR>

" comment out lines
nnoremap <silent> ;# :s:^:#:<CR>
nnoremap <silent> ;3 :s:^:#:<CR>
nnoremap <silent> ;/ :s:^://:<CR>
nnoremap <silent> ;' :s:^:':<CR>
nnoremap <silent> ;" :s:^:":<CR>
nnoremap <silent> ;; :s:^:;:<CR>
nnoremap <silent> ;% :s:^:%:<CR>
vnoremap <silent> ;# :s:^:#:<CR>
vnoremap <silent> ;3 :s:^:#:<CR>
vnoremap <silent> ;/ :s:^://:<CR>
vnoremap <silent> ;' :s:^:':<CR>
vnoremap <silent> ;" :s:^:":<CR>
vnoremap <silent> ;; :s:^:;:<CR>
vnoremap <silent> ;% :s:^:%:<CR>

" use the cut buffer register (accessible outside vim)
vnoremap <silent> <C-x> "+x
vnoremap <silent> <C-c> "+y
" ^Pi to paste before, ^Pa to paste after
nnoremap <silent> <C-p>i "+gP
nnoremap <silent> <C-p>a "+gp

" scroll by visual lines (easier to edit wrapped text)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap <Down> gj
vnoremap <Up>   gk


    "-----------------------------
    " Display output of shell command
    " (http://xrl.us/DisplayShellOutput)
    "-----------------------------

command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
command! -complete=file -nargs=+ SCPR call s:RunShellCommand
    \('rsync --modify-window=1 -Phavze "ssh -xac blowfish-cbc" '.<q-args>)

function! s:RunShellCommand(cmdline)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
endfunction


if has('autocmd')

    "-----------------------------
    " Buffer options
    "-----------------------------

    autocmd FileType make,sshconfig setlocal nolist noexpandtab
    autocmd FileType html,xhtml setlocal ts=2 sts=2 sw=2
    autocmd FileType php setlocal autoindent smartindent
    "autocmd FileType python setlocal textwidth=78
    autocmd FileType *tex setlocal textwidth=78

    " Markdown
    augroup markdown
        autocmd BufRead *.markdown
        \   setlocal ai nosi formatoptions=tcroqn2 comments=n:>
    augroup END

    " return to the previous point in the file
    autocmd BufReadPost *
    \   if line("'\"") > 0 && line("'\"") <= line("$") |
    \       exe "normal g'\"" |
    \   endif

    " ebooks
    autocmd BufReadPre *.book
    \   setlocal viminfo='100,\"10,:10,%,n~/.viminfo |
    \   setlocal nowrite nomodifiable nonumber nolist
    autocmd BufReadPost *.book
    \   nnoremap <Up> (zz |
    \   nnoremap <Down> )zz


    "-----------------------------
    " Templates
    "-----------------------------

    autocmd BufNewFile *.html 0r ~/.vim/skeleton.html "| normal! Gdd8<CR>o
    autocmd BufNewFile *.io   0r ~/.vim/skeleton.io | normal! G
    autocmd BufNewFile *.py   0r ~/.vim/skeleton.py | normal! G
    autocmd BufNewFile *.sh   0r ~/.vim/skeleton.sh | normal! G

    " C/C++ header files
    " http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates
    function! s:template_h()
        let gatename = '__'.substitute(toupper(expand('%:t')), '\\.', '_', 'g')
        execute "normal! i#ifndef " . gatename
        execute "normal! o#define " . gatename
        execute "normal! Go#endif /* " . gatename . " */"
        normal! O
    endfunction
    autocmd BufNewFile *.{h,hpp} call <SID>template_h()

endif  " has('autocmd')
