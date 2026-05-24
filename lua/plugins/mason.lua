return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier", -- JS/TS/HTML/CSS formatter
        "black", -- Python formatter
        "isort", -- Python import sorter

        -- LSP Servers
        "pyright", -- Python LSP
        "typescript-language-server", -- TypeScript LSP

        -- Linters
        "eslint_d", -- JavaScript/TypeScript linter
        "pylint", -- Python linter
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "html",
        "cssls",
      },
    },
  },
}
