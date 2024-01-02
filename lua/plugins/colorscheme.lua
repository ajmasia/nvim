return {
  {
    "navarasu/onedark.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins

    --   vim.cmd([[ colorscheme onedark ]])
    -- end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "storm" },
    -- priority = 1001,
  },
}
