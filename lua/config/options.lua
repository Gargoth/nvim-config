-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local wo = vim.wo
local bo = vim.bo

local TAB_WIDTH = 4

bo.tabstop = TAB_WIDTH
bo.shiftwidth = TAB_WIDTH
bo.expandtab = true
g.autoformat = false
