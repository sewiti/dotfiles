call plug#begin()
    Plug 'gruvbox-community/gruvbox'
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

set exrc
set noerrorbells
set mouse=a

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
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
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
