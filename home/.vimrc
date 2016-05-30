" ensure useful vim-specific features are available
set nocompatible

" determine the os
if has('unix')
    let s:uname = system('echo -n "$(uname -s)"')
    let shell='bash'
else
    let s:uname = ''
end

" use unicode
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    scriptencoding utf8
endif

" see modules/vim-pathogen
call pathogen#infect()

" enable syntax highlighting
syntax on

" indentation & formatting
if exists(':filetype')
    filetype plugin indent on
endif

" set the <Leader> key, for user-specific mappings
let mapleader=' '

" color scheme (for non-GUI vim)
colors elflord

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
set nomodeline              " don't read modelines
set showmatch               " highlight matching brackets when typing
set ignorecase smartcase    " ignorecase implied if search string is lowercase
set viminfo=""              " don't use a viminfo file
set nobackup writebackup    " temporary backup before writing
set showtabline=1           " show tabs if more than 1
set bs=eol,start,indent     " allow backspacing over everything
set mouse=a                 " allow mouse in all modes
set shm=flmnrxoOstTI        " make some messages less verbose
set noshortname             " don't use dos-style filenames
set scrolloff=5             " keep the cursor near the middle
set tw=0 wrap nojs lbr
set expandtab list
set number nuw=4 fdc=0
set nospell spelllang=en    " disable spellcheck

" Format options:
"   c - auto-wrap comments
"   r - add comment leader after hitting Enter in insert mode
"   q - allow formatting comments with gq
"   n - format numbered lists
"   l - don't break long lines in insert mode if the line was long when the
"       insert command started
"   1 - don't break the line after a one-letter word
"   j - remove comment leader when joining lines
set formatoptions=crqnl1j


" indent wrapped lines
if has('linebreak')
    set showbreak=.. breakindent breakindentopt=shift:4,sbr
endif


" keep swap files in a separate location (mainly to keep Dropbox from going nuts)
set directory=~/.vim/tmp,/var/tmp/$USER

" OS X stuff
if s:uname == 'Darwin'
    set backupskip=/tmp/*,/private/tmp/*
    set t_kb=  " Ctrl-V Backspace
    fixdel
end


"=====================================================================
"
" Spaces and tabs
"
"=====================================================================

set tabstop=4                   " how existing tabs are displayed
set softtabstop=4               " tabs in insert mode
set shiftwidth=4 shiftround     " indent operations
set autoindent smartindent

if &encoding == 'utf-8'
    set listchars=tab:·\ ,trail:.
else
    set listchars=tab:>\ ,trail:.
endif

" temporarily turn off expandtab
nnoremap <Leader><Tab>t :setlocal nolist noexpandtab<CR>
nnoremap <Leader><Tab>s :setlocal list expandtab<CR>

" temporarily change tab size
nnoremap <Leader><Tab>2 :setlocal tabstop=2 softtabstop=2 shiftwidth=2<CR>
nnoremap <Leader><Tab>4 :setlocal tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader><Tab>8 :setlocal tabstop=8 softtabstop=8 shiftwidth=8<CR>

" delete trailing spaces
nnoremap <Leader>dw :%s/\s\+$//<CR>

" avoid the non-breaking space character (alt-space on OS X)
inoremap <M-Space> <Space>
nnoremap <Leader>d<Space> :%s:[\u00A0]:\ :g<CR>


"=====================================================================
"
" Misc shortcuts
"
"=====================================================================

" easy command line
nnoremap <Leader><Space> :
nnoremap <Leader>; :

" type jj in insert mode to escape
inoremap jj <Esc>

" toggle paste mode
set pastetoggle=<F4>

" toggle settings
nnoremap <silent> <Leader>!n :set number!<CR>
nnoremap <silent> <Leader>!s :set spell!<CR>
nnoremap <silent> <Leader>!/ :set hlsearch!<CR>

" select all
nnoremap <Leader>sa ggVG
nnoremap <Leader>% ggVG

" regular expressions (with \v for more sane character matching)
nnoremap <Leader>s/ :s/\v//g<Left><Left><Left>

" new tab
nnoremap <Leader>t :tabnew<Space>
nnoremap <Leader>nt :tabnew<CR>
" previous tab
nnoremap <Leader>[ gT
nnoremap <Leader>ht gT
" next tab
nnoremap <Leader>] gt
nnoremap <Leader>lt gt
" move tab
nnoremap <Leader>mt :tabm<Space>

" explore
nnoremap <Leader>xx :Explore<CR>
nnoremap <Leader>xt :Texplore<CR>

" switch buffers
nnoremap <Tab><Tab> <C-w><C-w>

" toggle a fold
nnoremap <S-Tab> za

" comment out lines
nnoremap <silent> <Leader>/# :s:^:#:<CR>
vnoremap <silent> <Leader>/# :s:^:#:<CR>
nnoremap <silent> <Leader>/3 :s:^:#:<CR>
vnoremap <silent> <Leader>/3 :s:^:#:<CR>
nnoremap <silent> <Leader>// :s:^://:<CR>
vnoremap <silent> <Leader>// :s:^://:<CR>
nnoremap <silent> <Leader>/' :s:^:':<CR>
vnoremap <silent> <Leader>/' :s:^:':<CR>
nnoremap <silent> <Leader>/" :s:^:":<CR>
vnoremap <silent> <Leader>/" :s:^:":<CR>
nnoremap <silent> <Leader>/; :s:^:;:<CR>
vnoremap <silent> <Leader>/; :s:^:;:<CR>
nnoremap <silent> <Leader>/% :s:^:%:<CR>
vnoremap <silent> <Leader>/% :s:^:%:<CR>

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

" select recently pasted text
nnoremap <Leader>v V`]

" convert to html (and use the HTML5 doctype)
nnoremap <Leader>>h :TOhtml<CR>:1s/HTML[^>]*/html/<CR>

" wrap a paragraph
nnoremap <Leader>q gqap

" skip between sections in markdown files
autocmd FileType markdown nnoremap ]] /^[-=]<CR>
autocmd FileType markdown nnoremap [[ ?^[-=]<CR>


"=====================================================================
"
" Move to beginning and end of line
" http://jezenthomas.com/moving-to-the-beginning-of-the-line/
"
"=====================================================================

noremap <silent> H :call FirstCharOrFirstCol()<CR>
noremap L $

function! FirstCharOrFirstCol()
    let current_col = virtcol('.')
    normal ^
    let first_char = virtcol('.')
    if current_col <= first_char
        normal 0
    endif
endfunction


"=====================================================================
"
" Buffer options
"
"=====================================================================

" filetype-specific settings
autocmd FileType gitcommit setlocal tw=72 colorcolumn=50
autocmd FileType go,make,sshconfig setlocal nolist noexpandtab
autocmd FileType markdown setlocal ai nosi tw=78 fo=tcroqn2 com=n:>
autocmd FileType php setlocal autoindent smartindent
autocmd FileType text setlocal tw=78 formatoptions-=n
autocmd FileType tex,plaintex setlocal textwidth=78

" 2 spaces for tabs
autocmd FileType asciidoc,html,xhtml,htmldjango,markdown,php,rst,text,yaml setlocal ts=2 sts=2 sw=2

" known filetypes with unrecognised extensions
autocmd BufRead *.less setlocal ft=css
autocmd BufRead *.plist setlocal ft=xml
autocmd BufRead *.cue setlocal ts=2 softtabstop=2 shiftwidth=2

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
