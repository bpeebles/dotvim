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
autocmd FileType rst set sw=4 ts=4 softtabstop=4

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
Bundle 'kevinw/pyflakes-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
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

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

map <c-f> :call DmenuOpen("e")<cr>
map <c-s> :call DmenuOpen("split")<cr>
