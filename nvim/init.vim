call plug#begin('~/.vim/vim-plug/plugins')

Plug 'ghifarit53/tokyonight-vim'
Plug 'cocopon/iceberg.vim'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'docunext/closetag.vim'
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

setlocal nospell
set spelllang=de_de,en_gb


call plug#end()


set termguicolors
"colorscheme catppuccin-mocha
colorscheme iceberg
"colorscheme tokyonight
"let g:tokyonight_style = 'storm' " available: night, storm
"let g:tokyonight_enable_italic = 1



"set encoding=utf8
"set fileencodings-utf8

set updatetime=300

" Set the status line.
set statusline=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" Cursor settings
set cursorline
set nocursorcolumn

" Show the line number.
set number
set relativenumber

" The mouse pointer is hidden when characters are typed.
set mousehide

" Use visual bell instead of beeping.
set noerrorbells
set visualbell

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=8 


" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Tenths of a second to show the matching parentheses.
set matchtime=5 

" When on, the title of the window will be set to the value of 'titlestring'
" (if it is not empty), or to: filename [+=-] (path) - VIM
set title 

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set cindent
set expandtab
set smarttab

set wrap
let &showbreak='└─>'
set linebreak
set breakindent

" Display the color column
set colorcolumn=+1

" Turn on list chars only when needed since it is not compatible with
" linebreak.
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,nbsp:_,trail:.

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrapscan

set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undodir


" Set the map leader
let mapleader = "\<space>"


syntax enable

"nnoremap <silent> <Space>ll :w 
nnoremap <silent> <Space>ll :VimtexCompile <CR>
nnoremap <silent> <Space>w :w <CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
