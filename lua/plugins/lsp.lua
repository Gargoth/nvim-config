return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = false,
    },
    setup = {
      svelte = function(_, opts)
        LazyVim.lsp.on_attach(function(client, buffer)
          if client.name == "svelte" then
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end
        end)
      end,
    },
  },
}
