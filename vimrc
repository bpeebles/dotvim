" vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'mhinz/vim-signify'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/syntastic'
Plug 'wellsjo/wellsokai.vim'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'Yggdroot/indentLine'

call plug#end()

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

set background=dark
set encoding=utf-8
set expandtab
set shiftround
set hlsearch
set ignorecase
set smartcase
set showmatch
set title
set hidden
set history=5000
set wildignore+=*.sw*,*.pyc,*.class,*.o
set wildmode=list:longest
set noerrorbells
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
augroup FileTypes
  autocmd!
  autocmd BufNewFile,BufRead *.module,*.inc setfiletype php
  autocmd BufNewFile,BufRead *.zcml setfiletype xml
augroup END

augroup Indents
  autocmd!
  autocmd FileType php set cindent sw=2 ts=2 softtabstop=2
  autocmd FileType xml set sw=2 ts=2 softtabstop=2
  autocmd FileType html set sw=2 ts=2 softtabstop=2
  autocmd FileType javascript set sw=2 ts=2 softtabstop=2 cindent
augroup END
"
" Python {{{
augroup Python
  autocmd!
  " I normally keep tabstop and softtabstop identical, but since Python
  " sees actual tab characters as 8 always, show them as that.
  autocmd FileType python setlocal foldmethod=indent foldnestmax=2 ts=8 expandtab sw=4 softtabstop=4
augroup END
" }}}

" ReStructuredText {{{
augroup ft_rest
  au!
  au FileType rst set sw=4 ts=4 softtabstop=4
  " Do ReStructuredText-style sections over and underlining. Non-shifted is
  " just underlining, shifted is over and under.
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>! yypVr#yykPjj:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>1 yypVr#:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>@ yypVr*yykPjj:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>2 yypVr*:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader># yypVr=yykPjj:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>3 yypVr=:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>$ yypVr-yykPjj:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>4 yypVr-:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>% yypVr^yykPjj:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>5 yypVr^:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>^ yypVr"yykPjj:redraw<cr>
  au Filetype rst,markdown,python nnoremap <buffer> <localleader>6 yypVr":redraw<cr>
augroup END
" }}}

" JSON {{{
augroup JSON
  autocmd!
  autocmd BufNewFile,BufRead *.json set filetype=json
  autocmd BufNewFile,BufRead *.jsonp set filetype=json
  autocmd FileType json nnoremap <buffer> <localleader>j :%!python -m json.tool<CR>:%s/\s\+$//<CR>
augroup END
" }}}

" Markdown {{{
augroup Markdown
  autocmd!
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  au FileType rst set sw=4 ts=4 softtabstop=4
augroup END
" }}}

" Color scheme settings
colorscheme wellsokai
highlight clear SignColumn
hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE guibg=#3a3a3a guifg=NONE

" CtrlP Settings
let g:ctrlp_cmd='CtrlPMixed'  " Search everything by default
let g:ctrlp_root_markers = ['.ctrlp'] " Enable .ctrlp to mark top for ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

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

" Yapf
nnoremap <leader>y :call yapf#YAPF()<cr>

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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

let g:indentLine_char = '¦'
let g:indentLine_color_term = 237

" Add mappings to always move between windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

if has('nvim')
  " Neovim terminal configuration
  tnoremap <Esc><Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
  inoremap <A-h> <C-\><C-N><C-w>h
  inoremap <A-j> <C-\><C-N><C-w>j
  inoremap <A-k> <C-\><C-N><C-w>k
  inoremap <A-l> <C-\><C-N><C-w>l
endif
