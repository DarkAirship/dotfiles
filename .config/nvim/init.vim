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


" Key-bindings and remaps
"" Normal mode
""" Enter commands with space
nn <space> :

""" Insert lines with o
nn o o<esc>
nn O O<esc>

""" Center cursor when searching
nn n nzz
nn N Nzz

""" Yank to the end of line
nn Y y$

""" Resize splits with arrows
nn <up>    :resize +2<cr>
nn <down>  :resize -2<cr>
nn <right> :vertical resize -2<cr>
nn <left>  :vertical resize +2<cr>

""" Jump between splits with ctrl-[hjkl]
nn <silent> <c-k> :wincmd k<CR>
nn <silent> <c-j> :wincmd j<CR>
nn <silent> <c-h> :wincmd h<CR>
nn <silent> <c-l> :wincmd l<CR>

"" Insert mode
""" Exit with jj
ino jj <esc>

""" Delete a line while in Insert mode
ino <c-d> <esc>ddi

""" Disable keys
ino <up> <nop>
ino <down> <nop>
ino <right> <nop>
ino <left> <nop>
ino <bs> <nop>
ino <enter> <nop>

"" Visual mode
""" Move selected area with JK
xn K :move '<-2<CR>gv-gv
xn J :move '>+1<CR>gv-gv

" Leader-bindings for settings
let mapleader = '\'

nn <silent> <leader>\ :source $MYVIMRC<cr>
nn <silent> <leader>] :set nu! rnu!<cr>
nn <silent> <leader>g :Goyo<cr>
nn <leader>v :vsplit $MYVIMRC<cr>
nn <leader>t :Tabularize /
nn <leader>r :setlocal keymap=russian-jcukenwin<CR>:echo 'RU'<cr>
nn <leader>e :setlocal keymap=<cr>:echo 'EN'<cr>

" Markdown settings
nn <leader>h I## <esc>j4ddjI*<esc>A*<esc>
nn <leader>l I*<esc>A*<esc>
nn <leader>a 0r ^i**<esc>ea**<esc>
nn <leader>i Bi*<esc>ea*<esc>
nn <leader>b Bi**<esc>Ea**<esc>

ino <leader>u <esc>vBUEa

autocmd FileType markdown :setlocal textwidth=0 cole=2


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
let g:modeMap={
      \ "n"      : "n",
      \ "v"      : "v",
      \ "V"      : "vl",
      \ "\<c-v>" : "vb",
      \ "i"      : "i",
      \ "R"      : "r",
      \ "Rv"     : "rv",
      \ "c"      : "c",
      \ "t"      : "f",
      \}

set laststatus=2
set statusline=
set statusline+=%#DiffText#%{(g:modeMap[mode()]=='n')?'\ \ normal\ ':''}
set statusline+=%#DiffAdd#%{(g:modeMap[mode()]=='i')?'\ \ insert\ ':''}
set statusline+=%#DiffDelete#%{(g:modeMap[mode()]=='r')?'\ \ replace\ ':''}
set statusline+=%#DiffDelete#%{(g:modeMap[mode()]=='rv')?'\ \ v-replace\ ':''}
set statusline+=%#DiffChange#%{(g:modeMap[mode()]=='v')?'\ \ visual\ ':''}
set statusline+=%#DiffChange#%{(g:modeMap[mode()]=='vl')?'\ \ v-line\ ':''}
set statusline+=%#DiffChange#%{(g:modeMap[mode()]=='vb')?'\ \ v-block\ ':''}
set statusline+=%#DiffText#%{(g:modeMap[mode()]=='c')?'\ \ command\ ':''}
set statusline+=%#DiffText#%{(g:modeMap[mode()]=='f')?'\ \ finder\ ':''}
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
