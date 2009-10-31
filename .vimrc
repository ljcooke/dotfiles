" ensure useful vim-specific features are available
set nocompatible
scriptencoding utf8

" enable syntax highlighting
syntax on

" indentation & formatting
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
set cmdheight=1             " command line height
set number                  " line numbers
set ruler                   " show 'line,column' ruler
set nohlsearch              " don't highlight search results (enable with :hls)
set background=dark         " light on dark

set incsearch               " jump to search result while typing
set ff=unix ffs=unix,dos    " unix newlines
set nocindent               " <del>fix # indentation</del>
set modeline                " read modelines (e.g. 'vim: set blah=blah :')
set showmatch               " highlight matching brackets when typing
set ignorecase smartcase    " ignorecase implied if search string is lowercase
set viminfo=""              " don't use a viminfo file
set nobackup writebackup    " temporary backup before writing
set textwidth=0 wrap nojs linebreak   " text width (use gqap to wrap)
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

" OS X stuff
" TODO: figure out how to make this only apply to OS X
set backupskip="/tmp/*,/private/tmp/*"
set t_kb=ctrl-vBACKSPACE
fixdel

if &encoding == 'utf-8'
    set listchars=tab:·\ ,trail:.
else
    set listchars=tab:>\ ,trail:.
endif

if has('gui_running')
    set lines=30 columns=100
    set go=aeimrL
    set mousehide

    set guifont=Glass\ TTY\ VT220:h20,Inconsolata,Andale\ Mono\ 11,DejaVu\ Sans\ Mono\ 11,Terminal
    colors ir_black  "desert
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

" Ctrl/Shift-Enter in insert mode to insert a new line
" (disabled -- doesn't autoindent)
"inoremap <C-CR> <Esc>o<Esc>a
"inoremap <S-CR> <Esc>O<Esc>a

" show/hide unprintable characters
nnoremap <silent> ,p :set invlist<CR>

" toggle line numbers
nnoremap <silent> <F2> :set nonumber!<CR>

" select all
nnoremap <F5> ggVG

" quick regex (D -> Cmd in OS X)
nnoremap <C-Space> :s///<Left><Left>
nnoremap <D-/> :s///<Left><Left>

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

" use tabs instead of spaces
nnoremap <silent> ;t :setlocal nolist noexpandtab<CR>
nnoremap <silent> ;s :setlocal list expandtab<CR>

" replace non-breaking spaces
nnoremap ;<space> :%s:[\u00A0]:\ :g<CR>

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
    autocmd FileType html,xhtml,htmldjango,php setlocal ts=2 sts=2 sw=2
    autocmd FileType php setlocal autoindent smartindent
    autocmd FileType *tex setlocal textwidth=78

    " closetag
    "let g:unaryTagsStack='area base br hr img link meta param'
    "au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

    autocmd BufRead *.plist setlocal ft=xml

    autocmd FileType markdown setlocal
    \   ai nosi tw=78 formatoptions=tcroqn2 comments=n:>


    "-----------------------------
    " Templates
    "-----------------------------

    " highlight %VAR placeholders
    autocmd! BufRead * syn match Todo "%\u\+%" containedIn=ALL

    " jump between %VAR% placeholders with Ctrl-p
    nnoremap <silent> <C-p> /%\u.\{-1,}%<CR>c/%/e<CR>
    inoremap <silent> <C-p> <ESC>/%\u.\{-1,}%<CR>c/%/e<CR>

    " C/C++ header files
    " http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates
    function! s:template_h()
        let gatename = '__'.substitute(toupper(expand('%:t')), '\.', '_', 'g')
        execute "normal! i#ifndef " . gatename
        execute "normal! o#define " . gatename
        execute "normal! Go#endif /* " . gatename . " */"
        normal! O
    endfunction
    autocmd BufNewFile *.{h,hpp} call <SID>template_h()

endif  " has('autocmd')


    "-----------------------------
    " Hyde
    "-----------------------------

" TODO: figure out a good way to do this
"nnoremap <idontknow> gg/^\s\screated<CR>v$:!date '+\%F \%k:\%M:\%S \%:z'<CR>>>
