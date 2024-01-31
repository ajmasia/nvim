return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "eslint-lsp",
        "shfmt",
        "rnix-lsp",
        "astro-language-server",
        "tailwindcss-language-server",
        "emmet-ls",
      },
    },
  },
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
}
