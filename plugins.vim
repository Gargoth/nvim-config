filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'dense-analysis/ale'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-commentary'

Plug 'psliwka/vim-smoothie'

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'feline-nvim/feline.nvim'
call plug#end()

" Mappings
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <C-b> <cmd>NERDTreeToggle<cr>
nnoremap <Leader>f <Plug>(prettier-format)

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

" ALE config
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 500
let g:ale_lint_on_text_changed = "never"

" Treesitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Telescope config
lua << EOF
require'telescope'.setup {
  defaults = { file_ignore_patterns = {"node_modules", "venv", "__pycache__", ".git"} },
}
EOF

" Prettier config
nnoremap <leader>p :Prettier<cr>
