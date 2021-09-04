" Plug-ins (junegunn/vim-plug)
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim' | Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive' | Plug 'godlygeek/tabular'

"Plug 'plasticboy/vim-markdown'
"Plug 'gabrielelana/vim-markdown'

call plug#end()


" Basic settings
set nobackup nowritebackup list lcs=tab:»_,trail:·
set splitbelow splitright showcmd noshowmode nocursorline textwidth=80
set incsearch hlsearch ignorecase smartcase showmatch linebreak
set wildmode=longest,list,full scrolloff=10 wildmenu nowrap whichwrap+=h,l
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
set nospell spelllang=en_us,en_gb,ru_yo
syntax on
filetype on
filetype plugin on
echo ">^.^<"

" Color
colorscheme nord
"colorscheme seoul256
set termguicolors
let g:limelight_conceal_ctermfg = 240
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE


" Commands
:ca Tab Tabularize


" Key-bindings
"" Regular key remaps
nn <space> :
nn o o<esc>
nn O O<esc>
nn n nzz
nn N Nzz
nn Y y$

nn <Up> <nop>
nn <Down> <nop>
nn <Right> <nop>
nn <Left> <nop>

ino jj <esc>
ino <c-d> <esc>ddi

xn K :move '<-2<CR>gv-gv
xn J :move '>+1<CR>gv-gv

"" Leader-bindings for settings
let mapleader = '\'

nn <leader>\ :source $MYVIMRC<cr>
nn <leader>] :set nu! rnu!<cr>:echo<cr>
nn <leader>g :Goyo<cr>:echo<cr>
nn <leader>r :set keymap=russian-jcukenwin<CR>:echo<cr>
nn <leader>e :set keymap=<cr>:echo<cr>
nn <leader>v :vsplit $MYVIMRC<cr>


" Markdown settings
nn <leader>h I#<esc>
nn <leader>l I*<esc>A*<esc>

ino <leader>i <esc>bi*<esc>ea*
ino <leader>b <esc>bi**<esc>ea**
ino <leader>u <esc>vBUea

autocmd bufreadpre *.md setlocal textwidth=0
autocmd bufreadpre *.md setlocal conceallevel=0


" Goyo settings
function! s:goyo_enter()
    set noshowcmd
    set notermguicolors
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set showcmd
    set termguicolors
    set scrolloff=5
    Limelight!
    hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" Status-line (:so $VIMRUNTIME/syntax/hitest.vim)
set laststatus=2
set statusline=
set statusline+=%#DiffText#
set statusline+=%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffAdd#
set statusline+=%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#
set statusline+=%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#DiffChange#
set statusline+=%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=%{(mode()=='C-v')?'\ \ VBLOCK\ ':''}
set statusline+=%#jedifunction#
set statusline+=\ %y
set statusline+=%r
set statusline+=%m
set statusline+=%{FugitiveStatusline()}
set statusline+=%=
set statusline+=\ %f\ 
set statusline+=%#DiffText#
set statusline+=\ %l/%L
set statusline+=\ [%c]
