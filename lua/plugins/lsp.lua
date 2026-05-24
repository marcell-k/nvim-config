return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "standard",
                diagnosticMode = "workspace",
              },
            },
          },
        },
        html = {
          filetypes = { "html", "templ" },
        },
        cssls = {},
      },
    },
  },
}
