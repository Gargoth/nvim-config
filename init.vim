" Runtime Setup
syntax on

set noerrorbells

"" Setting default tab
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set relativenumber
set number

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set backspace=indent,eol,start
set nohlsearch
set scrolloff=8
set nowrap
set incsearch

set encoding=utf8

" Mappings
let mapleader=" "
"" Copy entire file to clipboard
nnoremap <leader>yy :'<,'>w !clip.exe<CR>
nnoremap <leader>cc :w !clip.exe<CR>
"" Switch between splits with alt+movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Source plugins
source ~/.config/nvim/plugins.vim