function remove_underscores(str)
  return str:gsub("_", "")
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local Util = require("lazyvim.util")
    local icons = require("lazyvim.config").icons

    -- vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icon = "" },
        },
        lualine_c = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          Util.lualine.root_dir(),
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { Util.lualine.pretty_path() },
        },
        lualine_x = {
          -- show command status
          -- {
          --   function()
          --     return require("noice").api.status.command.get()
          --   end,
          --   cond = function()
          --     return package.loaded["noice"] and require("noice").api.status.command.has()
          --   end,
          --   color = Util.ui.fg("Statement"),
          -- },
          {
            function(msg)
              local trim = require("utils.strings").trim
              msg = msg or "LSP Inactive"

              ---@diagnostic disable-next-line: missing-parameter, deprecated
              local buf_clients = vim.lsp.buf_get_clients()
              local buf_client_names = {}

              if next(buf_clients) == nil then
                if type(msg) == "boolean" or #msg == 0 then
                  return "LS Inactive"
                end

                return msg
              end

              -- add client
              for _, client in pairs(buf_clients) do
                if client.name ~= "copilot" then
                  local client_name = client.name

                  table.insert(buf_client_names, client_name)
                end
              end

              local unique_client_names = vim.fn.uniq(buf_client_names)
              local language_servers = table.concat(unique_client_names, " ") .. " "

              return "[" .. trim(language_servers) .. "]"
            end,
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
            color = Util.ui.fg("Constant"),
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = Util.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.ui.fg("Special"),
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
        -- lualine_z = {
        --   function()
        --     return " " .. os.date("%R")
        --   end,
        -- },
        lualine_z = {
          { "location", padding = { right = 1, left = 1 } },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
