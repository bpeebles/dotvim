set nocompatible
" Needed for vundle
filetype off

"
"set background=dark
color desert256bdp
syn on comment minlines=10 maxlines=1000
filetype plugin indent on
set encoding=utf-8
set expandtab
set smarttab
set shiftround
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set title
set hidden
set history=1000
set wildignore+=*.sw*,*.pyc,*.class,*.o
set wildmenu
set wildmode=list:longest
set noerrorbells
set ruler
set laststatus=2
set number


let mapleader = ","

set list
set listchars=tab:>-,trail:·
",eol:$
" toggle displaying the trailing characters
nmap <silent> <leader>s :set nolist!<CR>

" clear the current highlighted search
nnoremap <leader><space> :noh<cr>

" select the lines from the previous paste using the [] marks
nmap <leader>p `[v`]

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

set pastetoggle=<F2>

" Define custom extentions for filetype
au BufNewFile,BufRead *.module,*.inc setfiletype php
au BufNewFile,BufRead *.pkb,*.pks,*.view setfiletype plsql
au BufNewFile,BufRead *.zcml setfiletype xml

autocmd FileType php set cindent sw=2 ts=2 softtabstop=2
autocmd FileType perl set cindent sw=4 ts=4 softtabstop=4
autocmd FileType xml set sw=2 ts=2 softtabstop=2
autocmd FileType html set sw=2 ts=2 softtabstop=2
autocmd FileType python set foldmethod=indent

" Python config from http://hg.python.org/cpython/file/tip/Misc/Vim/vimrc
runtime pythonrc.vim


" Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
Bundle 'kevinw/pyflakes-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" vim-scripts repos
"Bundle 'L9'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on
set ai
