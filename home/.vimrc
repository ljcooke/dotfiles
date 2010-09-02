" ensure useful vim-specific features are available
set nocompatible
scriptencoding utf8

" enable syntax highlighting
syntax on

" indentation & formatting
if exists(':filetype')
    filetype plugin indent on
endif

" set shell
if has('unix')
    let shell='bash'
endif

" general settings
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
set showtabline=1           " show tabs if more than 1
set bs=eol,start,indent     " allow backspacing over everything
set scrolloff=2             " a few lines of offset when scrolling
set mouse=a                 " allow mouse in all modes
set shm=flmnrxoOstTI        " make some messages less verbose
set noshortname             " don't use dos-style filenames

" tabs + indentation
set tabstop=4               " how existing tabs are displayed
set softtabstop=4           " tabs in insert mode
set shiftwidth=4            " for indent operations
set shiftround              " round indent to a multiple of shiftwidth
set ai si                   " autoindent + smartindent

" expand tabs to spaces, and show tab characters and trailing whitespace
set expandtab list
if &encoding == 'utf-8'
    set listchars=tab:·\ ,trail:.
else
    set listchars=tab:>\ ,trail:.
endif

" temporarily turn off expandtab
nnoremap <silent> ;t :setlocal nolist noexpandtab<CR>
nnoremap <silent> ;s :setlocal list expandtab<CR>

" temporarily change tab size
nnoremap <Tab>2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2<CR>
nnoremap <Tab>4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <Tab>8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8<CR>

" keep swap files in a separate location (mainly to keep Dropbox from going nuts)
set directory=~/.vim/tmp,/var/tmp/$USER

" OS X stuff
" TODO: figure out how to make this only apply to OS X
set backupskip="/tmp/*,/private/tmp/*"
set t_kb=ctrl-vBACKSPACE
fixdel

" colour scheme + gui settings
if has('gui_running')
    set lines=40 columns=120
    set go=aeimrL
    set mousehide

    set guifont=Menlo,Inconsolata,Andale\ Mono\ 11,DejaVu\ Sans\ Mono\ 11,Terminal
    colors ir_black  "desert
else
    colors elflord
endif



" if I could pick just one key mapping...
nnoremap <Space> :

" easy brackets
"inoremap '' ''<Left>
"inoremap "" ""<Left>
"inoremap () ()<Left>
"inoremap <> <><Left>
"inoremap {} {}<Left>
"inoremap [] []<Left>
"inoremap () ()<Left>

" toggle paste mode
set pastetoggle=<F4>

" toggle line numbers
nnoremap <silent> <F2> :set nonumber!<CR>

" select all
nnoremap <F5> ggVG

" quick regex (D = Cmd in OS X)
nnoremap <C-Space> :s///<Left><Left>
nnoremap <D-/> :s///<Left><Left>

" new tab
nnoremap <Tab>n :tabnew<Space>
nnoremap <Tab>t :tabnew<Space>
" go to next tab
nnoremap <Tab>l gt
nnoremap <Tab><Right> gt
nnoremap <Tab>] gt
" go to previous tab
nnoremap <Tab>h gT
nnoremap <Tab><Left> gT
nnoremap <Tab>[ gT
" move tab
nnoremap <Tab>m :tabm<Space>

" switch buffers
nnoremap <Tab><Tab> <C-w><C-w>

" toggle a fold
nnoremap <S-Tab> za

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

" replace non-breaking space characters (for those accidental Opt+Spaces)
nnoremap ;<space> :%s:[\u00A0]:\ :g<CR>

" use the cut buffer register (accessible outside vim)
vnoremap <silent> <C-x> "+x
vnoremap <silent> <C-c> "+y
" ^Pi to paste before, ^Pa to paste after
nnoremap <silent> <C-p>i "+gP
nnoremap <silent> <C-p>a "+gp

" scroll by visual lines (easier to edit wrapped text)
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap <Down> gj
vnoremap <Up>   gk



" buffer options
if has('autocmd')

    " filetype-specific settings
    autocmd FileType make,sshconfig setlocal nolist noexpandtab
    autocmd FileType html,xhtml,htmldjango,php setlocal ts=2 sts=2 sw=2
    autocmd FileType php setlocal autoindent smartindent
    autocmd FileType *tex setlocal textwidth=78
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2

    " known filetypes with unrecognised extensions
    autocmd BufRead *.less setlocal ft=css
    autocmd BufRead *.plist setlocal ft=xml

    " .cue sheet
    autocmd BufRead *.cue setlocal ts=2 softtabstop=2 shiftwidth=2

    " python
    autocmd FileType python inoremap :: <End>:

    " markdown
    autocmd FileType markdown setlocal
    \   ai nosi tw=78 formatoptions=tcroqn2 comments=n:>

    " files with yaml front matter
    " http://www.codeography.com/2010/02/20/making-vim-play-nice-with-jekylls-yaml-front-matter.html
    autocmd FileType markdown,textile syntax match Comment /\%^---\_.\{-}---$/

    " C/C++ header file template
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



if has('python')
end
