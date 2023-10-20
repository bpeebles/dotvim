if has('nvim')
  " Specific Pythons for Neovim to speed up start up
  if filereadable($HOME . '/.pyenv/versions/neovim2/bin/python')
    let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
  endif
  if filereadable($HOME . '/.pyenv/versions/neovim3/bin/python')
    let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
  endif

  set updatetime=100
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'amiorin/vim-textile'
Plug 'ap/vim-buftabline'
Plug 'bpeebles/vim-commitvention'
Plug 'cespare/vim-toml'
Plug 'CKolkey/neogit'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'ggandor/leap.nvim'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'junegunn/gv.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}

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

Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'mhinz/vim-signify'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'pwntester/octo.nvim'
Plug 'rhysd/committia.vim'
Plug 'sindrets/diffview.nvim'
Plug 'raimon49/requirements.txt.vim'
Plug 'srstevenson/vim-picker'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'yuezk/vim-js'

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

set mouse=

" Don't try to save a swap to current dir until last resort
set directory=/tmp//,~/tmp//,/var/tmp//,.

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

" buffer navication
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>d :bd<cr>

" Convert a search into folds
" From http://vim.wikia.com/wiki/Folding_with_Regular_Expression
nnoremap <localleader>z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
" Delete the folds set by \z
nnoremap <localleader>Z :setlocal foldcolumn=0 foldexpr=<CR>
" Make a new command Foldsearch that searches and folds
command! -nargs=+ Foldsearch exe "normal /".<q-args>."\z"

" Enable tagbar toggle shortcut
nmap <F8> :TagbarToggle<CR>

set pastetoggle=<F2>

augroup Python
  autocmd!
  " I normally keep tabstop and softtabstop identical, but since Python
  " sees actual tab characters as 8 always, show them as that.
  autocmd FileType python setlocal foldnestmax=2 ts=8 expandtab sw=4 softtabstop=4
  " autocmd FileType python let b:ale_linters=['ruff', 'flake8', 'mypy', 'pylint', 'pyright', 'bandit']
  autocmd FileType python let b:ale_linters=['ruff', 'mypy' ]
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

" buftabline settings
let g:buftabline_numbers=1
let g:buftabline_indicators=1

" undotree options
nnoremap <F5> :UndotreeToggle<CR>

" Yapf
nnoremap <leader>y :call yapf#YAPF()<cr>

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" lightline configuration
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'charvaluehex', 'treesitter'] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead',
      \   'treesitter': 'nvim_treesitter#statusline',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

set noshowmode

" vim-signify settings
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_focusgained = 1

" indentLine settings
let g:indentLine_char = '|'
let g:indentLine_color_term = 238
let g:indentLine_faster = 1

" ale settings
let g:ale_virtualenv_dir_names = ['virtualenv', 'venv']
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_pattern_options = {
\   'work/snakex/.*\.js$': {
\       'ale_linters': ['eslint'],
\       'ale_fixers': ['eslint', 'prettier'],
\   },
\   'work/snakex/.*\.css$': {
\       'ale_fixers': ['prettier'],
\   },
\   'work/snakex/.*\.scss$': {
\       'ale_fixers': ['prettier'],
\   },
\   'work/excompanion/.*\.js$': {
\       'ale_linters': ['eslint'],
\       'ale_fixers': ['eslint', 'prettier'],
\   },
\   'work/excompanion/.*\.css$': {
\       'ale_fixers': ['prettier'],
\   },
\}

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
nnoremap <leader>G :Grepper -tool rg<cr>

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" tree-sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  --ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "c", "rust" },  -- list of language that will be disabled
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = false
  },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Find files using Telescope command-line sugar.
nnoremap <leader>fx <cmd>Telescope builtin<cr>
nnoremap <leader>fe <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fw <cmd>Telescope grep_string<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope git_status<cr>

lua <<EOF
require('telescope').setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      anchor = "SE",
      height = 0.7,
      width = 0.8,
      preview_cutoff = 5,
    },
  },
}
require('telescope').load_extension('fzy_native')
EOF

" Octo
lua <<EOF
require('octo').setup({
  file_panel = {
    use_icons = false
  }
})
EOF

" Leap.nvim
lua <<EOF
require('leap').set_default_keymaps()
EOF
