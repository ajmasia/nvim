return {
  {
    "nvimdev/dashboard-nvim",
    enabled = true,
    opts = function()
      local logo = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]]

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
        },
        -- stylua: ignore
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
