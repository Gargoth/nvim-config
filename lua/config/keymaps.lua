-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Harpoon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
end)

vim.keymap.set("n", "<leader>hs", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)

vim.keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end)
