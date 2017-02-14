
call plug#begin()

" Appearance

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nathanaelkane/vim-indent-guides'

" Code integrations

Plug 'neomake/neomake'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'

Plug 'davidhalter/jedi-vim'

Plug 'tmhedberg/SimpylFold'

" Version control integration

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" File handling

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" File editing

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'

" File navigating

Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'matchit.zip'

call plug#end()

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
syntax enable

set background=dark
colorscheme solarized
highlight Normal ctermbg=None

set hidden

set wildignore=*.swp,*.pyc
set wildmode=longest,list,full
set wildmenu

autocmd FileType html setlocal sw=2 sts=2 ts=2
autocmd FileType less setlocal sw=2 sts=2 ts=2
autocmd FileType css  setlocal sw=2 sts=2 ts=2
autocmd FileType javascript  setlocal sw=2 sts=2 ts=2

autocmd FileType python set iskeyword-=:
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

let g:python_host_prog = '/home/ubuntu/neovim2/bin/python'
let g:python3_host_prog = '/home/ubuntu/neovim3/bin/python'

let g:neomake_python_pylint_maker = {
           \ 'args': [
               \ '--output-format=text',
               \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
               \ '--reports=no',
               \ '--rcfile=django/pylintrc'
               \ ],
           \ 'errorformat':
               \ '%A%f:%l:%c:%t: %m,' .
               \ '%A%f:%l: %m,' .
               \ '%A%f:(%l): %m,' .
               \ '%-Z%p^%.%#,' .
               \ '%-G%.%#',
           \ 'postprocess': function('neomake#makers#ft#python#PylintEntryProcess')
           \ }
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_open_list = 0
highlight NeomakeErrorSign ctermfg=red ctermbg=black
highlight NeomakeWarningSign ctermfg=darkgreen ctermbg=black

autocmd! BufWritePost * Neomake

map <leader>b :FZF<CR>
map <leader>f :NERDTreeToggle<CR>
map <leader>t :TagbarToggle<CR>
map <leader>u :GundoToggle<CR>

let g:gitgutter_sign_column_always = 1
set updatetime=100 " for git gutter

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif " close scratch window automatically

" let g:deoplete#disable_auto_complete = 1
inoremap <silent><expr> <TAB>
           \ pumvisible() ? "\<C-n>" :
           \ <SID>check_back_space() ? "\<TAB>" :
           \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:jedi#completions_enabled = 0

let g:EasyMotion_do_shade = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
highlight IndentGuidesOdd ctermbg=black
highlight IndentGuidesEven ctermbg=black

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
