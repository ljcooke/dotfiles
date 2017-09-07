" -----------------------------------------------------------------------------
" Init
" -----------------------------------------------------------------------------

" Vim 8 adds support for loading packages from the pack/ subdirectory.
" Use Pathogen to backport this to older versions of Vim.
" [Help: packages]
if has('packages') == 0
  execute pathogen#infect()
end

" Use the default syntax highlighting rules.
" [Help: syntax-on]
syntax on

" Detect file types and use the appropriate plugins and indentation rules.
" [Help: filetype-plugin, filetype-indent]
filetype plugin indent on

" Set an initial color scheme for terminal vim. The gvimrc file will override
" this for GUI vim.
" [Help: colorscheme]
colors elflord

" -----------------------------------------------------------------------------
" Netrw (file browser)
" [Help: netrw]
" -----------------------------------------------------------------------------

" Remove the banner. (Press I to toggle.)
let g:netrw_banner = 0

" Use a tree view by default. (Press i to cycle through the view types.)
let g:netrw_liststyle = 3

" Open files in a new tab.
let g:netrw_browse_split = 3

" Set the % width when opened in a vertical split (with :Vexplore).
let g:netrw_winsize = 25

" -----------------------------------------------------------------------------
" Mappings for the easy-align plugin
" -----------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" -----------------------------------------------------------------------------
" Old settings to update
" -----------------------------------------------------------------------------

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

let mapleader=' '

set ttyfast                 " using a fast connection
set cmdheight=1             " command line height
set number                  " line numbers
set ruler                   " show 'line,column' ruler
set nohlsearch              " highlight search results? (clear with :noh)
set background=dark         " light on dark
set incsearch               " jump to search result while typing
set ff=unix ffs=unix,dos    " unix newlines
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

"
" Format options:
"
"   c - auto-wrap comments
"   r - add comment leader after hitting Enter in insert mode
"   q - allow formatting comments with gq
"   n - format numbered lists
"   l - don't break long lines in insert mode if the line was long when the
"       insert command started
"   1 - don't break the line after a one-letter word
"   j - remove comment leader when joining lines
"
set formatoptions=crqnl1j

" indent wrapped lines
if has('linebreak')
  set showbreak=.. breakindent breakindentopt=shift:4,sbr
endif

" keep swap files in a separate location (mainly to keep Dropbox from going nuts)
set directory=~/.vim/tmp,/var/tmp/$USER

" macOS
if s:uname == 'Darwin'
  set backupskip=/tmp/*,/private/tmp/*
  set t_kb=  " Ctrl-V Backspace
  fixdel
end

" https://github.com/tmux/tmux/issues/543#issuecomment-248980734
set clipboard=unnamed

set tabstop=4                   " how existing tabs are displayed
set softtabstop=4               " tabs in insert mode
set shiftwidth=4 shiftround     " indent operations
set autoindent smartindent

if &encoding == 'utf-8'
  set listchars=tab:·\ ,trail:.,nbsp:·
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
nnoremap <Leader>dw :%s/\s\+$//e<CR>:noh<CR>

" replace non-breaking spaces
" (easy to insert by mistake on macOS with Alt-Space)
inoremap <M-Space> <Space>
nnoremap <Leader>d<Space> :%s:[\u00A0]:\ :eg<CR>:noh<CR>

" exit insert mode when using arrows
inoremap <silent> <Up> <Esc><Up>
inoremap <silent> <Down> <Esc><Down>

" easy command line
nnoremap <Leader><Space> :
nnoremap <Leader>; :

" breaking habits
nnoremap <Leader>q<CR> :q

" toggle paste mode
set pastetoggle=<F4>

" toggle settings
nnoremap <silent> <Leader>!n :set number!<CR>:set number?<CR>
nnoremap <silent> <Leader>!s :set spell!<CR>:set spell?<CR>
nnoremap <silent> <Leader>!/ :set hlsearch!<CR>:set hlsearch?<CR>

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
nnoremap <silent> <Leader>/# :s:^:#:<CR>:noh<CR>
vnoremap <silent> <Leader>/# :s:^:#:<CR>:noh<CR>
nnoremap <silent> <Leader>/3 :s:^:#:<CR>:noh<CR>
vnoremap <silent> <Leader>/3 :s:^:#:<CR>:noh<CR>
nnoremap <silent> <Leader>// :s:^://:<CR>:noh<CR>
vnoremap <silent> <Leader>// :s:^://:<CR>:noh<CR>
nnoremap <silent> <Leader>/' :s:^:':<CR>:noh<CR>
vnoremap <silent> <Leader>/' :s:^:':<CR>:noh<CR>
nnoremap <silent> <Leader>/" :s:^:":<CR>:noh<CR>
vnoremap <silent> <Leader>/" :s:^:":<CR>:noh<CR>
nnoremap <silent> <Leader>/; :s:^:;:<CR>:noh<CR>
vnoremap <silent> <Leader>/; :s:^:;:<CR>:noh<CR>
nnoremap <silent> <Leader>/% :s:^:%:<CR>:noh<CR>
vnoremap <silent> <Leader>/% :s:^:%:<CR>:noh<CR>

" scroll by visual lines (easier to edit wrapped text)
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap <Down> gj
vnoremap <Up>   gk

" filetype-specific settings
autocmd FileType gitcommit setlocal colorcolumn=50
autocmd FileType go,make,sshconfig setlocal nolist noexpandtab
autocmd FileType markdown setlocal ai nosi tw=78 fo=tcroqn2 com=n:>
autocmd FileType php setlocal autoindent smartindent
autocmd FileType text setlocal tw=78 formatoptions-=n
autocmd FileType tex,plaintex setlocal textwidth=78

" 2 spaces for tabs
autocmd FileType asciidoc,html,xhtml,htmldjango,markdown,php,rst,ruby,text,yaml setlocal ts=2 sts=2 sw=2
