return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {},
  keys = {
    { '\\', ':NvimTreeOpen<CR>', { desc = 'NvimTree open' } },
    { '|', ':NvimTreeClose<CR>', { desc = 'NvimTree close' } },
  },
}
