-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- fidget loader settings
local taskColor = "#d7d7d7"
local titleColor = "#FFBF00"

vim.cmd("highlight FidgetTitle guifg=" .. titleColor)
vim.cmd("highlight FidgetTask guifg=" .. taskColor)
