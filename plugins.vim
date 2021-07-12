filetype plugin on
let g:polyglot_disabled = ['autoindent']

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-marketplace coc-pyright coc-discord-rpc coc-html coc-html-css-support coc-git coc-emmet coc-tsserver coc-json coc-clangd

Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'

Plug 'vim-airline/vim-airline'

Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'gosukiwi/vim-atom-dark'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'shaunsingh/nord.nvim'
call plug#end()

" Mappings
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <C-b> <cmd>NERDTreeToggle<cr>

" Set colorscheme
set background=dark
let g:one_allow_italics = 1
colorscheme one
let g:airline_theme='one'
set termguicolors

" Add :Prettier to commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
