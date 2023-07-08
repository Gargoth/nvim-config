-- Require modules
require("options")
require("mappings")
require("plugins")
require("lsp")

-- Set colorscheme
vim.cmd([[colorscheme catppuccin]])

-- Neovide
if vim.g.neovide then
    vim.o.guifont = "JetBrains Mono NF:h10"
    vim.g.neovide_scale_factor = 0.85
end
