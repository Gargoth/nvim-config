let g:polyglot_disabled = ['autoindent']

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'vim-airline/vim-airline'

Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'gosukiwi/vim-atom-dark'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'shaunsingh/nord.nvim'
call plug#end()

" Set colorscheme
set background=dark
let g:one_allow_italics = 1
colorscheme one
let g:airline_theme='one'
set termguicolors

source ~/.config/nvim/markdownconfig.vim

" Set telescope to ignore node_modules
lua << EOF require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
