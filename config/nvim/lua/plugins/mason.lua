return {
  -- Mason: LSP/DAP/Linter/Formatter installer
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "stylua",
        "shfmt",
        "shellcheck",
        -- Web
        "prettier",
        "eslint-lsp",
        -- Python
        "black",
        "ruff",
        -- Markdown
        "markdownlint",
      },
    },
  },
  -- Mason-lspconfig: Bridge between mason and lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
    },
  },
}
