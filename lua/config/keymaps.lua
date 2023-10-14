-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

-- To link with which-key, use the following syntax and add main keymap to the whick-key pluging config:
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create new Obsidian Note" })
vim.keymap.set("n", "<leader>ux", "<cmd>TSContextToggle<cr>", { desc = "Toogle Treesitter context" })
