-- Set Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

if vim.fn.has("wsl") then
    map("n", "<leader>y", ":w !clip.exe<CR>", { desc = "Copy buffer contents to clipboard", silent = true })
else
    map("n", "<leader>y", ":%y+<CR>", { desc = "Copy buffer contents to clipboard" })
end

-- Switch pane
map("n", "<A-h>", "<C-w>h", { desc = "Switch to left pane" })
map("n", "<A-j>", "<C-w>j", { desc = "Switch to lower pane" })
map("n", "<A-k>", "<C-w>k", { desc = "Switch to upper pane" })
map("n", "<A-l>", "<C-w>l", { desc = "Switch to right pane" })

-- Resize current pane
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase pane height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease pane height" })
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease pane width" })
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase pane width" })

-- Plugin Managers
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason" })

-- LSP
map("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format current buffer using LSP" })

-- Telescope
map("n", "<leader>p", "<cmd>Telescope find_files<CR>", { desc = "Find Files in Directory using Telescope" })
map("n", "<leader>d", "<cmd>Telescope diagnostics<CR>", { desc = "List all diagnostics for buffers using Telescope" })
map("n", "K", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition of hovered word using Telescope" })
map(
    "n",
    "<leader>f",
    "<cmd>Telescope current_buffer_fuzzy_find<CR>",
    { desc = "Find Files in Directory using Telescope" }
)

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Open file tree (Neotree)" })

-- Harpoon
map("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add file to Harpoon marks" })
map("n", "<leader>s", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Open Harpoon menu" })
map("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Navigate to next Harpoon mark" })
map("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = "Navigate to previous Harpoon mark" })
map("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Navigate to 1st Harpoon mark" })
map("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Navigate to 2nd Harpoon mark" })
map("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Navigate to 3rd Harpoon mark" })
map("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Navigate to 4th Harpoon mark" })
map("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", { desc = "Navigate to 5th Harpoon mark" })

-- Commentary
map("n", "<leader>/", "<cmd>Commentary<CR>", { desc = "Convert lines to comments" })
