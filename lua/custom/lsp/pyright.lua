require('lspconfig').basedpyright.setup {
  enabled = true,
  settings = {
    disableOrganizeImports = true, -- Using ruff
    basedpyright = {
      analysis = {
        -- ignore = { "*" },
        typeCheckingMode = 'standard',
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
      },
    },
  },
}
