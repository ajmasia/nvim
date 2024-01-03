return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    ---@class CatppuccinOptions
    opts = {
      flavour = "mocha",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_b = {
          { "branch", icon = "" },
        },
        lualine_z = {},
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
    opts = function()
      -- Neovim in binary generated from https://ascii.co.uk/text
      local logo = "01101110 01100101 01101111 01110110 01101001 01101101"

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "hyper",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          shortcut = {
            {
              desc = " Find File",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = "󱁴 Find Text",
              group = "Label",
              action = "Telescope live_grep",
              key = "g",
            },
            {
              desc = " Restore Session",
              group = "Number",
              action = "lua require('persistence').load()",
              key = "s",
            },
            {
              desc = "󰋠 Health",
              group = "DiagnosticHint",
              action = "checkhealth",
              key = "h",
            },
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              desc = " Config",
              group = "@property",
              action = "e $MYVIMRC",
              key = "c",
            },
          },
          footer = function()
            local currentConfig = "" .. os.getenv("MYVIMRC")
            local nvimVersion =
              string.format("Using Neovim v%d.%d.%d", vim.version().major, vim.version().minor, vim.version().patch)

            return { "", nvimVersion, currentConfig, "", "🚀 Sharp tools make good work" }
          end,
        },
      }
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
