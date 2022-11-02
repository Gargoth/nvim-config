filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'MunifTanjim/prettier.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'jbyuki/nabla.nvim'

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'feline-nvim/feline.nvim'
call plug#end()

" Mappings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-b> <cmd>NvimTreeToggle<cr>
nnoremap <a-L> :lua require("nabla").popup()<cr>


" Set Appearance
set background=dark
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin
lua << EOF
local ctp_feline = require('catppuccin.groups.integrations.feline')

require("feline").setup({
	components = ctp_feline.get(),
})
EOF

" gitsigns config
lua << EOF
require('gitsigns').setup()
EOF

" nvim-tree config
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
EOF

" Telescope config
lua << EOF
require('telescope').setup {
  defaults = { file_ignore_patterns = {"node_modules", "venv", "__pycache__", ".git"} },
}
EOF

" Prettier config
nnoremap <leader>p :Prettier<cr>
lua << EOF
require("prettier").setup({
    cli_options = {
        bracket_spacing = true,
        bracket_same_line = true,
        tab_width = 4,
        use_tabs = false,
    },
})
EOF

" Treesitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
