return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length=100" },
        },
        prettier = {
          prepend_args = { "--tab-width=2" },
        },
      },
    },
  },
}
