-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- swaping

vim.opt.swapfile = false -- disble swap files

vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})

vim.treesitter.language.register("markdown", "mdx")
