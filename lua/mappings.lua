-- Set Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

if vim.fn.has("wsl") then
    map("n", "<leader>c", ":w !clip.exe<CR>", { desc = "Copy buffer contents to clipboard", silent = true } )
else
    map("n", "<leader>c", ':%y+<CR>', { desc = "Copy buffer contents to clipboard" } )
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

-- Plugins
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>m", "<cmd>:Mason<cr>", { desc = "Mason" })
map("n", "<leader>p", "<cmd>Telescope find_files<CR>", { desc = "Find Files in Directory using Telescope" })
map("n", "<leader>f", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find Files in Directory using Telescope" })
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Open file tree (Neotree)" })
