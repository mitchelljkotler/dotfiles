" execute pathogen#infect()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
syntax enable

set modeline
set modelines=4

filetype plugin indent on
set hidden
set scrolloff=3
set is
set hls
set wildignore=*.swp,*.pyc
set wildmode=longest,list,full
set wildmenu

set t_Co=16

colorscheme solarized
hi Normal ctermbg=None
"hi Normal ctermbg=8

syn sync fromstart

let g:proj_flags='imstbg'

let python_highlight_all = 1
let python_highlight_space_errors = 1

autocmd BufEnter * let &titlestring = "vim [" . expand("%:t") . "]"
if &term == "screen" || &term == "screen-256color"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm" || &term == "screen-256color"
  set title
endif
"let &titleold = 'bash'

set nobackup
set nowritebackup

set t_kb=

map <leader>b :CtrlP<CR>

set laststatus=2
let g:airline_powerline_fonts = 1

autocmd FileType html setlocal sw=2 sts=2 ts=2
autocmd FileType less setlocal sw=2 sts=2 ts=2
autocmd FileType css  setlocal sw=2 sts=2 ts=2
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2

if has('gui_running')
  set guifont=Menlo_Regular:h14
endif

