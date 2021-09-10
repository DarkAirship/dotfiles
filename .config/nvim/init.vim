" Plug-ins (junegunn/vim-plug)
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim' | Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive' | Plug 'godlygeek/tabular'

"Plug 'plasticboy/vim-markdown'
"Plug 'gabrielelana/vim-markdown'

call plug#end()


" Basic settings
set nobackup nowritebackup encoding=UTF-8 list lcs=tab:»_,trail:·
set splitbelow splitright showcmd noshowmode nocursorline textwidth=80
set incsearch hlsearch ignorecase smartcase showmatch linebreak
set wildmode=longest,list,full scrolloff=10 wildmenu nowrap whichwrap+=h,l
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
set nospell spelllang=en_us,en_gb,ru_yo
syntax on
filetype on
filetype plugin on
echo '>^.^<'


" Color
colorscheme nord
"colorscheme seoul256
set termguicolors
let g:limelight_conceal_ctermfg = 242
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE


" Abbreviations
"" Commands

"" Typos
ia adn and


" Key-bindings
"" Regular key remaps
nn <space> :
nn o o<esc>
nn O O<esc>
nn n nzz
nn N Nzz
nn Y y$

nn <up>    :resize +2<cr>
nn <down>  :resize -2<cr>
nn <right> :vertical resize -2<cr>
nn <left>  :vertical resize +2<cr>

ino jj <esc>
ino <c-d> <esc>ddi

ino <up> <nop>
ino <down> <nop>
ino <right> <nop>
ino <left> <nop>
ino <bs> <nop>
ino <enter> <nop>

xn K :move '<-2<CR>gv-gv
xn J :move '>+1<CR>gv-gv

"" Leader-bindings for settings
let mapleader = '\'

nn <leader>\ :source $MYVIMRC<cr>
nn <leader>] :set nu! rnu!<cr>:echo<cr>
nn <leader>g :Goyo<cr>
nn <leader>r :setlocal keymap=russian-jcukenwin<CR>:echo 'RU'<cr>
nn <leader>e :setlocal keymap=<cr>:echo 'EN'<cr>
nn <leader>v :vsplit $MYVIMRC<cr>
nn <leader>t :Tabularize /

" Markdown settings
nn <leader>h I## <esc>j4ddjI*<esc>A*<esc>
nn <leader>l I*<esc>A*<esc>
nn <leader>a 0r ^i**<esc>ea**<esc>
nn <leader>i Bi*<esc>ea*<esc>
no <leader>b Bi**<esc>Ea**<esc>

ino <leader>u <esc>vBUEa

autocmd FileType markdown :setlocal textwidth=0 cole=2


" Goyo settings
function! s:goyo_enter()
    set noshowcmd
    echo
    set notermguicolors
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set showcmd
    echo
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
"set statusline+=%{(mode()=='^V')?'\ \ VBLOCK\ ':''}
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
