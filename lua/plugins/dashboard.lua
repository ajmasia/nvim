return {
  {
    "glepnir/dashboard-nvim",
    opts = function()
      local logo = [[
    ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
    ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║
    ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║
    ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
    ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      local opts = {
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
      }

      return opts
    end,
  },
}
