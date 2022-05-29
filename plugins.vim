filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'

Plug 'vim-airline/vim-airline'
Plug 'rakr/vim-one'
call plug#end()

" Mappings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-,> <cmd>lua require'telescope.builtin'.find_files({ cwd = vim.fn.stdpath('config') })<CR>
nnoremap <C-b> <cmd>NERDTreeToggle<cr>

" Set colorscheme
set background=dark
let g:one_allow_italics = 1
colorscheme one
let g:airline_theme='one'
set termguicolors

" Treesitter config
autocmd VimEnter * TSEnable highlight

" Telescope config
lua <<EOF
require'telescope'.setup {
  defaults = { file_ignore_patterns = {"node_modules", "venv", "__pycache__", ".git"} },
}
EOF
