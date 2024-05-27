return {
  "neovim/nvim-lspconfig",
  opts = {
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

      arduino = function(_, opts)
        require("lspconfig").arduino_language_server.setup({})
      end,
    },
  },
}
