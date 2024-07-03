require('lspconfig').basedpyright.setup {
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
