return {
  'SmiteshP/nvim-navic',
  dependencies = 'neovim/nvim-lspconfig',
  opts = {
    icons = {
      File = '󰈙 ',
      Module = ' ',
      Namespace = '󰌗 ',
      Package = ' ',
      Class = '󰌗 ',
      Method = '󰆧 ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = '󰕘',
      Interface = '󰕘',
      Function = '󰊕 ',
      Variable = '󰆧 ',
      Constant = '󰏿 ',
      String = '󰀬 ',
      Number = '󰎠 ',
      Boolean = '◩ ',
      Array = '󰅪 ',
      Object = '󰅩 ',
      Key = '󰌋 ',
      Null = '󰟢 ',
      EnumMember = ' ',
      Struct = '󰌗 ',
      Event = ' ',
      Operator = '󰆕 ',
      TypeParameter = '󰊄 ',
    },
    lsp = {
      auto_attach = true,
      preference = { 'ruff_lsp', 'pyright', 'ruff', 'svelte', 'vtsls', 'tsserver', 'tailwindcss' },
    },
    highlight = true,
    separator = ' > ',
    depth_limit = 0,
    depth_limit_indicator = '..',
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
      return text
    end,
  },
  config = function(_, opts)
    -- Since config is set, opts is passed in as a parameter instead of automatically calling setup
    require('nvim-navic').setup(opts)
    vim.o.winbar = "    %{%v:lua.require'nvim-navic'.get_location()%}"
  end,
}
