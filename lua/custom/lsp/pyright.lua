require('lspconfig').pyright.setup {
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
    python = {
      analysis = {
        ignore = { '*' }, -- Using Ruff
      },
    },
  },
}
