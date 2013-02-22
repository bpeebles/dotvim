set nocompatible
if has("gui_running")
  set guioptions=M
  set guifont=Envy\ Code\ R\ 9
endif
" Needed for vundle
filetype off

"
set background=dark
"color desert256bdp
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

" Don't try to save a swap to current dir until last resort
set directory=~/tmp,/var/tmp,/tmp,.

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

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

" Convert a search into folds
" From http://vim.wikia.com/wiki/Folding_with_Regular_Expression
nnoremap <localleader>z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
" Delete the folds set by \z
nnoremap <localleader>Z :setlocal foldcolumn=0 foldexpr=<CR>
" Make a new command Foldsearch that searches and folds
command! -nargs=+ Foldsearch exe "normal /".<q-args>."\z"

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Enable tagbar toggle shortcut
nmap <F8> :TagbarToggle<CR>

set pastetoggle=<F2>

" Define custom extentions for filetype
au BufNewFile,BufRead *.module,*.inc setfiletype php
au BufNewFile,BufRead *.zcml setfiletype xml

autocmd FileType php set cindent sw=2 ts=2 softtabstop=2
autocmd FileType perl set cindent sw=4 ts=4 softtabstop=4
autocmd FileType plsql set sw=2 ai cindent
autocmd FileType xml set sw=2 ts=2 softtabstop=2
autocmd FileType html set sw=2 ts=2 softtabstop=2
autocmd FileType javascript set sw=2 ts=2 softtabstop=2 cindent
" Python {{{

autocmd FileType python setlocal foldmethod=indent ts=8 expandtab sw=4 softtabstop=4

" }}}

" ReStructuredText {{{

au Filetype rst,python nnoremap <buffer> <localleader>! yypVr#yykPjj:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>1 yypVr#:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>@ yypVr*yykPjj:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>2 yypVr*:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader># yypVr=yykPjj:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>3 yypVr=:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>$ yypVr-yykPjj:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>4 yypVr-:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>% yypVr^yykPjj:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>5 yypVr^:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>^ yypVr"yykPjj:redraw<cr>
au Filetype rst,python nnoremap <buffer> <localleader>6 yypVr":redraw<cr>

augroup ft_rest
    au!

    au FileType rst set sw=4 ts=4 softtabstop=4
augroup END

" }}}

" Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'flazz/vim-colorschemes'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'kevinw/pyflakes-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'strange/strange.vim'

" vim-scripts repos
"Bundle 'L9'
Bundle 'matchit.zip'
Bundle 'python_match.vim'

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

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

filetype plugin indent on
set ai

" Color scheme settings
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme wombat256mod
highlight clear SignColumn

" CtrlP Settings
let g:ctrlp_cmd='CtrlPMixed'  " Search everything by default
let g:ctrlp_root_markers = ['.ctrlp'] " Enable .ctrlp to mark top for ctrlp
"let g:ctrlp_user_command = {
"  \ 'types': {
"    \ 1: ['.git', 'cd %s && git ls-files --exclude-standard'],
"    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"    \ },
"  \ 'fallback': 'find %s -type f'
"  \ }

" NERDTree stuff
"nmap <leader>t :NERDTreeToggle<CR>
"let NERDTreeIgnore=['\.pyc$','\~#']

" netrw config
let g:netrw_liststyle=3

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

" Surround settings
" Enable C-style commenting out with *
let b:surround_42 = "/* \r */"

vmap <leader>c gS*

" Write a file using sudo in case you opened it as not root
command Sudo :%!sudo tee > /dev/null %
