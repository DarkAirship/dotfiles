" Plug-ins {{{

" (junegunn/vim-plug)
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive' | Plug 'godlygeek/tabular'

call plug#end()

" }}}

" Basic settings {{{

set nobackup writebackup encoding=UTF-8 list lcs=tab:»_,trail:·
set splitbelow splitright showcmd noshowmode nocursorline textwidth=80
set incsearch hlsearch ignorecase smartcase showmatch linebreak
set wildmode=longest,full wildmenu scrolloff=10 nowrap whichwrap+=h,l
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab
set nospell spelllang=en_us,en_gb,ru_yo clipboard+=unnamedplus
set completeopt=longest,menuone
syntax on
filetype on
filetype plugin on
echo '>^.^<'

" Color settings
colorscheme nord
set termguicolors
let g:limelight_conceal_ctermfg = 242
highlight! Normal ctermbg=NONE guibg=NONE
highlight! NonText ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Autocommands for all files
augroup basic
    autocmd!
    "" Edit file from last position
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

    "" Remove trailing whitespace on save
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" }}}

" Goyo settings {{{

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

" }}}

" Remaps {{{

" Normal mode {{{

"" Enter commands with space
nnoremap <space> :

"" Insert lines with o
nnoremap o o<esc>
nnoremap O O<esc>

"" Center cursor when searching
nnoremap n nzz
nnoremap N Nzz

"" Yank to the end of line
nnoremap Y y$

"" Alias S = replace all
nnoremap S :%s//gI<left><left><left>

"" Jump between splits with ctrl-[hjkl]
nnoremap <silent> <c-k> :wincmd k<CR>
nnoremap <silent> <c-j> :wincmd j<CR>
nnoremap <silent> <c-h> :wincmd h<CR>
nnoremap <silent> <c-l> :wincmd l<CR>

"" Resize splits with arrows
"nnoremap <up>    :resize +2<cr>
"nnoremap <down>  :resize -2<cr>
"nnoremap <right> :vertical resize -2<cr>
"nnoremap <left>  :vertical resize +2<cr>

"" Disable keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap Q <nop>

" }}}

" Insert mode {{{

"" Exit with jj
inoremap jj <esc>

"" Delete a word when in Insert mode
inoremap <c-b> <c-w>

"" Delete a line while in Insert mode
inoremap <c-d> <esc>ddi

"" Disable keys
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <bs> <nop>
inoremap <enter> <nop>

" }}}

" Visual mode {{{

"" Move selected area with JK
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" }}}

" Command mode {{{

" Save file as sudo when no sudo priveleges
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" }}}

" }}}

" Leader-bindings {{{

let mapleader = '\'

"" QUIET
nnoremap <silent> <leader>q :echo<cr>

"" Source VIMRC
nnoremap <silent> <leader>\ :source $MYVIMRC<cr>

"" Open VIMRC in a split buffer
nnoremap <silent> <leader>v :vsplit $MYVIMRC<cr>

"" Show relative line numbers
nnoremap <silent> <leader>] :set nu! rnu!<cr>

"" Change keymaps between RU and EN
nnoremap <silent> <leader>r :setlocal keymap=russian-jcukenwin<CR>:echo 'RU'<cr>
nnoremap <silent> <leader>e :setlocal keymap=<cr>:echo 'EN'<cr>
inoremap <silent> <leader>r <esc> :setlocal keymap=russian-jcukenwin<cr>ha
inoremap <silent> <leader>e <esc> :setlocal keymap=<cr>ha

"" Toggle spellcheck
nnoremap <silent> <leader>s :setlocal spell!<cr>

"" Add folds
nnoremap <silent> <leader>fs :setlocal foldmethod=syntax<cr>
nnoremap <silent> <leader>fi :setlocal foldmethod=indent<cr>
nnoremap <silent> <leader>fd :setlocal foldmethod=diff<cr>
nnoremap <silent> <leader>nf :setlocal nofoldenable<cr>

"" Set a jumping mark
nnoremap <silent> <leader>m a<++><esc>

"" Jump to the next jumping mark
inoremap <silent> <leader>j <esc>/<++><cr>"_c4l

"" Enter Goyo
nnoremap <silent> <leader>g :Goyo<cr>

"" Tabularize command
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /

" }}}

" Status-line {{{

"" Create a dictionary of modes (othervise doesn't work)
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

"" Add items to statusline
"" Run :so $VIMRUNTIME/syntax/hitest.vim for colors
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
set statusline+=%{FugitiveStatusline()}
set statusline+=%m
set statusline+=%=
set statusline+=%f
set statusline+=\
set statusline+=%#DiffText#
set statusline+=\ %l/%L
set statusline+=\ [%c]

" }}}

" Vimscript file settings {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Markdown filetype settings {{{

augroup filetype_md
    autocmd!
    autocmd FileType markdown setlocal textwidth=0 cole=2

    "" Make subheading
    autocmd FileType markdown nnoremap <leader>h
                \ I## <esc>A,<esc>j3ddkJ2jI*<esc>A*<esc>

    "" Italisize a line
    autocmd FileType markdown nnoremap <leader>l I*<esc>A*<esc>

    "" Fix formatting
    autocmd FileType markdown nnoremap <leader>a 0r ^i**<esc>Ea**<esc>

    "" Italisize a word
    autocmd FileType markdown nnoremap <leader>i bi*<esc>ea*<esc>
    autocmd FileType markdown inoremap <leader>i bi*<esc>ea*<esc>

    "" Boldize a word
    autocmd FileType markdown nnoremap <leader>b Bi**<esc>Ea**<esc>
    autocmd FileType markdown inoremap <leader>b Bi**<esc>Ea**<esc>

    "" Uppercase a word
    autocmd FileType markdown inoremap <leader>u <esc>vBUEa

    " Quickly change heading
    autocmd FileType markdown onoremap ih :<c-u>execute
                \ "normal! ?^#\\+\r:nohlsearch\r0wvg_"<cr>
augroup END

" }}}

