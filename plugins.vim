filetype plugin on

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': ':CocInstall coc-clangd coc-python coc-vim coc-lua coc-tsserver' }

Plug 'lewis6991/gitsigns.nvim'

Plug 'MunifTanjim/prettier.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua', { 'on': 'NERDTreeToggle' }

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jbyuki/nabla.nvim', { 'for': ['markdown', 'latex'] }

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'

Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'feline-nvim/feline.nvim'
call plug#end()

source ~/.config/nvim/configs/catppuccin.vim
source ~/.config/nvim/configs/feline.vim
source ~/.config/nvim/configs/gitsigns.vim
source ~/.config/nvim/configs/nvim-tree.vim
source ~/.config/nvim/configs/telescope.vim
source ~/.config/nvim/configs/prettier.vim
source ~/.config/nvim/configs/treesitter.vim
