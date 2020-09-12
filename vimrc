if has('nvim')
  " Specific Pythons for Neovim to speed up start up
  if filereadable($HOME . '/.pyenv/versions/neovim2/bin/python')
    let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
  endif
  if filereadable($HOME . '/.pyenv/versions/neovim3/bin/python')
    let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
  endif

  set updatetime=100

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

" vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'amiorin/vim-textile'
Plug 'bling/vim-airline'
Plug 'bpeebles/vim-commitvention'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'mhinz/vim-signify'
Plug 'pearofducks/ansible-vim'
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" ncm2 things
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-rst-subscope'

Plug 'raimon49/requirements.txt.vim'
Plug 'srstevenson/vim-picker'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'w0rp/ale'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'Yggdroot/indentLine'

call plug#end()

" ncm2 related settings
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c
"
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Color scheme settings
colorscheme dracula

if has("gui_running")
  set guioptions=M
  set guifont=Envy\ Code\ R\ 9
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
set printdevice=pdf
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

augroup Python
  autocmd!
  " I normally keep tabstop and softtabstop identical, but since Python
  " sees actual tab characters as 8 always, show them as that.
  autocmd FileType python setlocal foldmethod=indent foldnestmax=2 ts=8 expandtab sw=4 softtabstop=4
augroup END

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
augroup END

" JSON things
augroup JSON
  autocmd!
  autocmd FileType json nnoremap <buffer> <localleader>j :%!python -m json.tool<CR>:%s/\s\+$//<CR>
augroup END

let g:vim_json_syntax_conceal = 0

" PHP things
let php_folding=2
augroup PHP
  autocmd!
  autocmd FileType php set foldmethod=syntax
augroup END


" Write a file using sudo in case you opened it as not root
command Sudo :%!sudo tee > /dev/null %

" undotree options
nnoremap <F5> :UndotreeToggle<CR>

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

" vim-signify settings
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_focusgained = 1

" indentLine settings
let g:indentLine_char = '|'
let g:indentLine_color_term = 238
let g:indentLine_faster = 1

" ale settings
let g:ale_virtualenv_dir_names = ['virtualenv', 'venv']

nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

" vim-picker settings
nmap <unique> <leader>pe <Plug>(PickerEdit)
nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>p] <Plug>(PickerTag)
nmap <unique> <leader>pw <Plug>(PickerStag)
nmap <unique> <leader>po <Plug>(PickerBufferTag)
nmap <unique> <leader>ph <Plug>(PickerHelp)

" grepper settings
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
