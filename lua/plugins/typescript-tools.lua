return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        tsserver_max_memory = "auto",
        publish_diagnostic_on = "change",
        expose_as_code_action = "all",
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
      handlers = {
        ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
          if result.diagnostics ~= nil then
            -- Filter out certain diagnostics if needed
            local filtered_diagnostics = {}
            for _, diagnostic in ipairs(result.diagnostics) do
              filtered_diagnostics[#filtered_diagnostics + 1] = diagnostic
            end
            result.diagnostics = filtered_diagnostics
          end
          return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        end,
      },
    },
  },
}
