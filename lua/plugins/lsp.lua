return {
  -- Servers installer
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },
  -- Servers configurations
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = {
        timeout_ms = 500,
      },
      servers = {
        lua_ls = {
          -- server installed manually behaind stylua
          mason = false,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["lua"] = { "stylua" },
        -- ["javascript"] = { { "prettierd", "prettier" } },
        -- ["javascriptreact"] = { { "prettierd", "prettier" } },
        -- ["typescript"] = { { "prettierd", "prettier" } },
        -- ["typescriptreact"] = { { "prettierd", "prettier" } },
        -- ["vue"] = { { "prettierd", "prettier" } },
        -- ["css"] = { { "prettierd", "prettier" } },
        -- ["scss"] = { { "prettierd", "prettier" } },
        -- ["less"] = { { "prettierd", "prettier" } },
        -- ["html"] = { { "prettierd", "prettier" } },
        -- ["json"] = { { "prettierd", "prettier" } },
        -- ["jsonc"] = { { "prettierd", "prettier" } },
        -- ["yaml"] = { { "prettierd", "prettier" } },
        -- ["markdown"] = { { "prettierd", "prettier" } },
        -- ["markdown.mdx"] = { { "prettierd", "prettier" } },
        -- ["graphql"] = { { "prettierd", "prettier" } },
        -- ["handlebars"] = { { "prettierd", "prettier" } },
      },
    },
  },
}
