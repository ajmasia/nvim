return {
  -- Servers installer
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "black",
        "ruff-lsp",
        "rnix-lsp",
        "shfmt",
        "astro-language-server",
      },
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
        ["nix"] = { "alejandra" },
        ["python"] = { "black" },
        ["javascript"] = { { "prettierd" } },
        ["javascriptreact"] = { { "prettierd" } },
        ["typescript"] = { { "prettierd" } },
        ["typescriptreact"] = { { "prettierd" } },
        ["vue"] = { { "prettierd" } },
        ["css"] = { { "prettierd" } },
        ["scss"] = { { "prettierd" } },
        ["less"] = { { "prettierd" } },
        ["html"] = { { "prettierd" } },
        ["json"] = { { "prettierd" } },
        ["jsonc"] = { { "prettierd" } },
        ["yaml"] = { { "prettierd" } },
        ["markdown"] = { { "prettierd" } },
        ["markdown.mdx"] = { { "prettierd" } },
      },
    },
  },
}
