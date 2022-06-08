filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'feline-nvim/feline.nvim'
call plug#end()

" Mappings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-b> <cmd>NERDTreeToggle<cr>
nmap <Leader>f <Plug>(prettier-format)

" Set colorscheme
set background=dark
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin

lua << EOF
require("feline").setup({
	components = require('catppuccin.core.integrations.feline'),
})
EOF

" Treesitter config
autocmd VimEnter * TSEnable highlight

" Telescope config
lua << EOF
require'telescope'.setup {
  defaults = { file_ignore_patterns = {"node_modules", "venv", "__pycache__", ".git"} },
}
EOF
