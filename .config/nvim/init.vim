" Plug-ins {{{
" (junegunn/vim-plug)

call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'chrisbra/colorizer'

call plug#end()

" }}}
" Vim settings {{{

"" Basics
set nobackup
set nomodeline
set encoding=UTF-8
set path+=**
filetype plugin indent on

"" Sensible splits
set splitbelow
set splitright

"" Search settings
set incsearch
set ignorecase
set smartcase
set showmatch

"" Textwidth and linebreaks
set textwidth=0
set linebreak
set nowrap
set scrolloff=10
set whichwrap+=h,l

"" Tab settings
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set expandtab

"" Complition options
set wildmenu
set wildmode=longest,full
set completeopt=longest,menuone

"" Disable spell-check by default (can toggle it with <leader>s)
set nospell
set spelllang=en_us,en_gb,ru_yo

"" Use system clipboard
set clipboard+=unnamedplus

" }}}
" Visual settings {{{

"" Enable syntax highlighting
syntax enable

"" Don't overload command line
set noshowmode
set showcmd

"" Don't show cursorline
set nocursorline

"" Display all colors
set termguicolors

"" Set colorscheme and fix it
colorscheme nord
highlight! Normal ctermbg=NONE guibg=NONE
highlight! NonText ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

"" Search highlighting
set hlsearch
highlight clear Search
highlight Search cterm=bold ctermfg=White ctermbg=Black guifg=White
highlight IncSearch cterm=bold ctermfg=White ctermbg=Red guifg=Red

"" Show whitespace characters
set listchars=tab:»_,trail:·

augroup whitespace_files
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END

"" Comments are important
highlight Comment cterm=bold cterm=italic ctermfg=gray gui=italic guifg=gray

"" Make the 81st column stand outMake the 81st column stand outMake the 81st column stand out
highlight ColorColumn ctermbg=white guibg=darkyellow
call matchadd('ColorColumn', '\%81v', 100)

"" Limelight settings
let g:limelight_conceal_ctermfg = 242

" }}}
" Helpful autocommands {{{

" Edit file from last position
augroup last_cursor_pos
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
        \ |   exe "normal! g`\""
        \ | endif
augroup END

" Remove trailing whitespace on save
augroup no_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" Auto-update vim config file
augroup vim_reload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Auto-reload leftwm after writing config
augroup leftwm_reload
    autocmd!
    autocmd BufWritePost *leftwm/config.toml :!leftwm-command SoftReload<CR>
augroup END

" }}}
" Autocorrections {{{

iabbrev    retrun  return
iabbrev     pritn  print
iabbrev       teh  the
iabbrev      liek  like
iabbrev        ;t  't
iabbrev      moer  more
iabbrev  previosu  previous

" }}}
" Remaps {{{

" Normal mode {{{

"" Enter commands with semicolon
nnoremap ; :
nnoremap : ;

"" Insert lines with o
nnoremap o o<Esc>
nnoremap O O<Esc>

"" Center cursor when searching
nnoremap n nzz
nnoremap N Nzz

"" Yank to the end of line
nnoremap Y y$

"" Alias S = replace all
nnoremap S :%s//gI<Left><Left><Left>

"" Swap Visual Block and Visual modes
nnoremap v <C-V>
nnoremap <C-V> v

"" Use space to jump down a page
nnoremap <Space> <PageDown>

"" Insert a line at the cursor
nnoremap <C-I> i<CR><Esc>

"" Jump between splits with ctrl-[hjkl]
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-L> :wincmd l<CR>

"" Resize splits with arrows
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>

"" Disable keys
"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>
"nnoremap <Right> <Nop>
"nnoremap <Left> <Nop>
nnoremap Q <Nop>

" }}}
" Insert mode {{{

"" Exit with jj
inoremap jj <Esc>

"" Delete a word when in Insert mode
inoremap <C-B> <C-W>

"" Delete a line while in Insert mode
inoremap <C-D> <Esc>ddi

"" Insert # in Russian layout by pressing №№
inoremap № #

"" Autoinsert brackets
"" (double tap for a single bracket)
inoremap " ""<left>
inoremap "" "
inoremap ' ''<left>
inoremap '' '
inoremap ( ()<left>
inoremap (( (
inoremap [ []<left>
inoremap [[ [
inoremap { {}<left>
inoremap {{ {
"" insert a block of code by pressing Enter after a curly bracket
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"" Disable keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
inoremap <BS> <Nop>
inoremap <Enter> <Nop>

" }}}
" Visual mode {{{

"" Enter commands with semicolon
xnoremap ; :
xnoremap : ;

"" Swap Visual Block and Visual modes
xnoremap v <C-V>
xnoremap <C-V> v

"" Insert with i
xnoremap i I

"" Use space to jump down a page
xnoremap <Space> <PageDown>

"" Make vaa select the entire file
xnoremap aa VGo1G

"" Move selected area with JK
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" }}}
" Command mode {{{

" Save file as sudo when no sudo priveleges
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <BAR> edit!

" }}}

" }}}
" Leader-bindings {{{

let mapleader = '\'

"" QUIET
nnoremap <silent> <leader>q :highlight! clear Search<CR>:echo<CR>

"" Source VIMRC
nnoremap <silent> <leader><Space> :source $MYVIMRC<CR>:echo '>^.^<'<CR>

"" Open VIMRC in a split buffer
nnoremap <silent> <leader>v :vsplit $MYVIMRC<CR>

"" Show line numbers
nnoremap <silent> <leader>] :set nu!<CR>

"" Show relative line numbers
nnoremap <silent> <leader>[ :set nu! rnu!<CR>

"" Change keymaps between RU and EN
"" Note that inoremap works only if there are spaces on new lines after cursor
nnoremap <silent> <leader>r :setlocal keymap=russian-jcukenwin<CR>:echo 'RU'<CR>
nnoremap <silent> <leader>e :setlocal keymap=<CR>:echo 'EN'<CR>
inoremap <silent> <leader>r <Esc>:setlocal keymap=russian-jcukenwin<CR>a
inoremap <silent> <leader>e <Esc>:setlocal keymap=<CR>a

"" Toggle spellcheck
nnoremap <silent> <leader>s :setlocal spell!<CR>

"" Add folds
nnoremap <silent> <leader>fs :setlocal foldmethod=syntax<CR>
nnoremap <silent> <leader>fi :setlocal foldmethod=indent<CR>
nnoremap <silent> <leader>fd :setlocal foldmethod=diff<CR>
nnoremap <silent> <leader>nf :setlocal nofoldenable<CR>

"" Set a jumping mark
nnoremap <silent> <leader>M a<++><Esc>
inoremap <silent> <leader>M <Esc>a<++>

"" Jump to the next jumping mark
nnoremap <silent> <leader>m /<++><CR>"_c4l<Esc>
inoremap <silent> <leader>m <Esc>/<++><CR>"_c4l

"" Enter Goyo
nnoremap <silent> <leader>g :Goyo<CR>

"" Tabularize command
nnoremap <leader>t :Tabularize /
vnoremap <leader>t :Tabularize /

"" Toggle Colorizer
nnoremap <silent> <leader>c :ColorToggle<CR>
inoremap <silent> <leader>c :ColorToggle<CR>

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
set statusline+=[%f]
set statusline+=%#DiffText#
set statusline+=\ %l/%L
set statusline+=\ [%c]

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
" Vimscript file settings {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
" LeftWM file settings {{{
"
"augroup filetype_leftwm
"    autocmd!
"    autocmd BufWritePost ~/.config/leftwm/config.toml execute ":! "
"augroup END
"
" }}}
" Markdown filetype settings {{{

augroup filetype_md
    autocmd!
    "" Basic settings
    autocmd FileType markdown setlocal textwidth=0 conceallevel=2

    "" Make subheading
    autocmd FileType markdown nnoremap <leader>h
                \ I## <Esc>A,<Esc>j3ddkJ2jI*<Esc>A*<Esc>

    "" Italisize a line
    autocmd FileType markdown nnoremap <leader>l I*<Esc>A*<Esc>

    "" Fix formatting
    autocmd FileType markdown nnoremap <leader>a 0r ^i**<Esc>Ea**<Esc>

    "" Italisize a word
    autocmd FileType markdown nnoremap <leader>i bi*<Esc>ea*<Esc>
    autocmd FileType markdown inoremap <leader>i <Esc>bi*<Esc>ea*

    "" Italisize two words
    autocmd FileType markdown nnoremap <leader>2i 2bi*<Esc>2ea*<Esc>
    autocmd FileType markdown inoremap <leader>2i <Esc>2bi*<Esc>2ea*

    "" Boldize a word
    autocmd FileType markdown nnoremap <leader>b Bi**<Esc>Ea**<Esc>
    autocmd FileType markdown inoremap <leader>b <Esc>Bi**<Esc>Ea**

    "" Uppercase a word
    autocmd FileType markdown inoremap <leader>u <Esc>vBUEa

    " Quickly change heading
    autocmd FileType markdown onoremap ih :<C-U>execute
                \ "normal! ?^#\\+\r:nohlsearch\r0wvg_"<CR>
augroup END


augroup journal
    "" Edit journal when opened
    autocmd BufRead 2022.md setlocal keymap=russian-jcukenwin
    "autocmd BufRead 2022.md Goyo

    "" Upload journal
    autocmd BufWritePost 2022.md execute ":! ~/.local/bin/dup"
augroup END
" }}}
" LaTeX filetype settings {{{

augroup filetype_tex
augroup END

" }}}
