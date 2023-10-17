call plug#begin()
    Plug 'morhetz/gruvbox'
call plug#end()

set exrc
set noerrorbells

set mouse=
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set relativenumber
set number

set nohlsearch
set ignorecase
set smartcase
set incsearch

set nowrap
set scrolloff=8
set sidescrolloff=8

set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

syntax on
colorscheme gruvbox

let mapleader=' '
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup sewiti
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
