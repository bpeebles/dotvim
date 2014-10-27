set nocompatible
if has("gui_running")
  set guioptions=M
  set guifont=Envy\ Code\ R\ 9
endif

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

if $COLORTERM == 'screen'
  set t_Co=256
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
" Keyboard timeout quicker to show mode line changes
set ttimeoutlen=100

" Printer options
set pdev=pdf
set printoptions=paper:letter,syntax:y,wrap:y

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
" how i want to display tabs and trailing whitespace
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
" I normally keep tabstop and softtabstop identical, but since Python
" sees actual tab characters as 8 always, show them as that.
autocmd FileType python setlocal foldmethod=indent foldnestmax=2 ts=8 expandtab sw=4 softtabstop=4

" }}}

" ReStructuredText {{{

" Do ReStructuredText-style sections over and underlining. Non-shifted is
" just underlining, shifted is over and under.
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
Plugin 'gmarik/vundle'

" Bundles here:
"
" original repos on github
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'strange/strange.vim'

" vim-scripts repos
Plugin 'matchit.zip'
Plugin 'python_match.vim'
Plugin 'psql.vim'

" non github repos
"Plugin 'git://git.wincent.com/command-t.git'
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ

filetype plugin indent on
set ai

" Color scheme settings
colorscheme wombat256mod
highlight clear SignColumn

" CtrlP Settings
let g:ctrlp_cmd='CtrlPMixed'  " Search everything by default
let g:ctrlp_root_markers = ['.ctrlp'] " Enable .ctrlp to mark top for ctrlp

" netrw config
" from http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/
" and
" http://ellengummesson.com/blog/2014/02/22/make-vim-really-behave-like-netrw/
" {{{netrw
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
nnoremap <leader>e :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_list_hide = '.*\.sw[po],.*\.pyc'

" Narrower
let g:netrw_winsize = -40

" Default to tree mode
let g:netrw_liststyle=3
" netrw}}}

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Surround settings
" Enable C-style commenting out with *
let b:surround_42 = "/* \r */"

vmap <leader>c gS*

" Write a file using sudo in case you opened it as not root
command Sudo :%!sudo tee > /dev/null %

" syntastic options
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_enable_highlighting=0
let g:syntastic_python_checkers=['python', 'flake8']

" undotree options
nnoremap <F5> :UndotreeToggle<CR>

" highlight lines in Sy and vimdiff etc.)

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy

highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" vim-airline configuration
" Turn on the buffer/tab list
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':~:.'
" Disable seperator pieces
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
